# WM_iOS_Assignment
# Assignment ADP
The project is a shell for a photo viewing application with the following features:
● List view for albums
● Grid view to display photo thumbnails for an album
● Photo view to view the full resolution version of the photo

# Description
The iOS app demonstrates clean architecture by implementing MVVM software desgin pattern. The app has been integrated with Typicode API with URL sessions. List will be on screen initially, On tap of album, it will show the photos with thumbnail, On tap on Thumbnail - it will show full resolution photo.

# Bonus point
Check the Internet connectivity with iOS native network and show the pop up


# Architecture ⚒️ 
I used the MVVM architecture pattern, because I think it has the perfect balance between response data and functionality for a small-medium sized project.

# API Calls
I used the URL session-REST way to implement the API calls using NetworkingService class.

# UI
I used storyboard to design the UI. I also design a couple of views programmatically when it's necessary.

# Libraries or Dependency 📚
I have used CocoaPods for loading Image from URL - Kingfisher is a powerful, pure-Swift library for downloading and caching images from the web. It provides you a chance to use a pure-Swift way to work with remote images in your next app. add via CocoaPods by adding this to your Podfile:

pod 'Kingfisher', '~> 5.0'

# Running the Tests
I have write some XCTest for application perfomace and API.


