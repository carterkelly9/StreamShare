## StreamShare

CMPT 276: Project Proposal

Group 3: Amandeep Rehal, Carter Kelly, Dillon Van Horn, Mya May, and Phillip Dykman

20th October 2017

### ABSTRACT

StreamShare is a collective shared media center.

Users upload media (e.g., videos, music, photos) that they would like to access online and share with other users. Each user has a media library of content containing personal and shared uploads. Users can create playlists and reviews.

Streamshare automically pulls metadata for album art/poster art.

The inter-user mechanics and file hosting is similar to Google Drive.

The media library management is similar to XBMC: an online media center.

### COMPETITIVE ANALYSIS

Most media centres focus on one media type, such as music (Subsonic, AudioGalaxy) or video (Air Video).

StreamShare focuses on several types of media with dedicated players for each kind.

Users who want access to all their personal or shared media would use StreamShare as a substitute for multiple apps focused on different media types.

### SCOPE

#### User login and session control

* User-space content

* User access to shared data

* Inter-user interactions - communication, sharing, allow/deny access to personal library

#### File hosting

* Users have individual storage space

* Upload protocols (web (http), SFTP, etc.)

#### Media library

* Web players for media types

* Automatic metadata fetching (art, synopsis, reviews, subtitles, etc.)

* Library navigation

#### API integration

* Media metadata fetching (several different APIs for media types - IMDB for reviews, OpenSubtitles for subs, etc.)

* Social media integration (twitter, facebook, etc.)

### SAMPLE STORIES

#### Story #1: User Authentication

* When the user clicks on the sign up or sign in, the sign up or sign in page will be loaded.

* If the authentication is successful, the default page containing all of the user's file will be displayed.

* The default page has a navigation bar where the use can search the uploaded files, find metadata of media or logout,which will exit the app and go back to the login page.

#### Story #2: File Hosting

* After the user successfully logs in, the user will be on the default page and can click upload or find files in the navigation bar. If the user clicks upload, several upload methods will be displayed from which the user must choose one. Once the user selects the files to be uploaded, the option of changing another user’s access will be displayed. Here, the user can directly share to email or social media.

#### Story #3: Media Library Search

* The user can use the search bar on the default page to search for the existing media files.

* When the media files are searched, the application automatically fetches relevant metadata and displays them.

#### Story #4: Opening files

* If the user clicks on a media file, the built-in player will play the content including the fetched metadata.

* The user can resume playing music and video where it left off, or fast forward and backward.
