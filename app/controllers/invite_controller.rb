class InviteController < ApplicationController
  before_action :get_session_user
  before_action :require_medium, except: [:add_share_by_invite, :remove_share]

  def index
    invite = get_medium_invite

    #sharing is off
    if !invite
      @invite_enabled = false
    #sharing is on
    else
      @invite_enabled = true
      @invite_url = request.base_url + invite_path + "?"+ {key: invite.key}.to_query
    end

    @shared_users = @medium.shared_users
  end

  #owner revokes single user from accessing this medium
  def revoke_share
    share = get_share
    share.destroy

    flash[:notice] = "#{User.find(params[:guest_id]).name} has been removed from this share."
    redirect_to action: :index, medium_id: params[:medium_id]
  end

  def revoke_all_shares
    shares = get_all_shares
    shares.destroy_all

    redirect_to action: :index, medium_id: params[:medium_id], notice: "All users were removed from share."
  end

  def enable_invite
    invite = get_medium_invite

    if !invite
      invite = Invite.create(sharing_params)
    end

    flash[:notice] = "Invite enabled."
    redirect_to action: :index, medium_id: params[:medium_id]
  end

  def disable_invite

    invite = get_medium_invite
    invite.destroy

    flash[:notice] = "Invite disabled."
    redirect_to action: :index, medium_id: params[:medium_id]
  end

  def add_share_by_invite
    invite = Invite.where(invite_params).first
    #fail: invite doesnt exist
    if !invite || !params[:key]
      redirect_to root_path, notice: "The invite key is invalid."

    #fail: invite's owner is current user
    elsif invite.owner_id.to_i == @user.id
      redirect_to root_path, notice: "Cannot add your own share."

    #fail: share already exists with this user
    elsif Share.exists?(owner_id: invite.owner_id, guest_id: @user.id, medium_id: invite.medium_id)
      redirect_to root_path, notice:  "The share #{share.medium.title} is already in your library."

    #success: invite exists, create share for guest user
    else
      share = Share.create(owner_id: invite.owner_id, guest_id: @user.id, medium_id: invite.medium_id)
      redirect_to root_path, notice:  "The share #{share.medium.title} has been added to your library."
    end
  end

  #guest removes a single share
  def remove_share
    if params[:medium_id]
      Share.where(medium_id: params[:medium_id], guest_id: @user.id).destroy_all
      flash[:notice] = "The share #{@medium.title} has been removed from your library."
    end
    redirect_to root_path
  end

private
    #check if medium has been specified, and if you are its owner
    def require_medium
      if !params[:medium_id] || !Medium.exists?(params[:medium_id] || Medium.find(params[:medium_id]).user_id != @user.id)
        redirect_to root_path
        return
      end
      @medium = Medium.find(params[:medium_id])
    end

    def get_medium_invite
      return Invite.where(sharing_params).first
    end

    def get_share
      if !params[:guest_id]
        redirect_to action: index, medium_id: params[:medium_id]
      end

      parameters = revoke_params
      parameters[:owner_id] = @user.id
      return Share.where(parameters).first
    end

    def get_all_shares
      return Share.where(sharing_params)
    end

    def get_session_user
      require_user
      current_user
      @user = @current_user
    end

    def invite_params
      params.permit(:key)
    end

    def sharing_params
      parameters = params.permit(:medium_id)
      parameters[:owner_id] = @user.id
      return parameters
    end

    def revoke_params
      params.permit(:medium_id, :guest_id)
    end
end
