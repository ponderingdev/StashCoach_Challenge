# StashCoach_Challenge

## Description

 The following project retrieves a list of 'Stages' to show to the user and displays it in a collection view. 
On initial load, please tap the 'Beging Challenge' button to go to the next screen. 

## Architecture 

  This was my first time implementing a project with VIPER architecture but there's overlap between this and MVP, which I'm  familiar with, so the separation layers wasn't completely new to me. In my code, the Router is responsible for setting up all the connections between the Presenter, View, and Interactor. The Router is initialized on tap of the 'Begin Challenge' button. Once that is done, the view controller then pushes the router's presenter's view, which in this case is the Collection View Controller. 
  
  The Collection View Controller then uses the presenter, who utilizes the interactor to read the JSON file. On success or failure, the communication is propagated all the way back to the Collection View Controller. 

## Unit Testing
  
  In the process of unit testing I ended up refactoring my code a bit e.g in my collection view I originally had the list of stages (from which to map the cells) and title as non-optionals. However, given that if the presenter fails to retrieve the required information then these two properties would reman nil throughout the entire flow.


## Pending clean up

 There’s currently a minor lag from the time the collection view is displayed until the images themselves are displayed. A better approach would be to show a loading indicator while the images are being set to the image view and once that is complete display the collection view. 


On iPad you will notice the ‘Level’ label font is comparatively smaller than its parent view, the circular image. The font size should be set relative to its parentview. Similarly, the progress view and the labels underneath have a much smaller height in comparison to the content size. 
  
Lastly, I didn't get a chance to test the UI, in particular, the asynchrous call where the cell retrieves the image from the url. That would be my next priority. 

