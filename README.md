# batmanjs-demos #

---

A collection of batman.js demos to showcase batman.js with different backends.

Having issues with a demo? Want to contribute? Raise a ticket and/or submit a pull request!

## Current demos ###

001-local-wordbump

## Submission rules ###
1. No single page apps. All files need to be in their respected folder (see folder convention)
2. Provide backend instructions on how to get it up and running (if using rails, rake db:setup, etc.)
3. Display the version of batman.js used within the app
4. Include the version of batman.js that the app is using. This is due to mass confusion among new people loading up demos that don't work with the most recent version. 
5. A README.md must be included within the directory (containing pertinent information from above).
6. Since batman.js advocates Coffeescript, no pure js solutions will be accepted.

## Adding a demo ##
1. Clone the 000-apptemplate folder and rename it via the naming convention
2. Update the current demos section list above with the folder name
3. Pull request

## Folder convention 
See the 000-apptemplate folder in the repo

## Naming convention ##
  ###-adapter-name[-backendlang] 
 
**Examples:**

- Local app: 001-local-wordpicker  
- Rails app: 001-rails-awesomeapp-ruby  
- C# MVC app: 001-rest-alphabet-csharp