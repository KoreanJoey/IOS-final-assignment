# IOS-final-assignment
 
Group Member: Sungheyok Jang (13396508), So Cheuk Hei(14463323), Seongha Cho (14444499)

Link for github repository :
https://github.com/KoreanJoey/IOS-final-assignment.git
Important Setup Instructions for Core Data

Problem Description
When you unzip and run the project, you might encounter an issue where the Core Data does not load properly. This typically occurs because the path to the Core Data model file (ListItemModel.xcdatamodeld) becomes invalid once the project is moved or its path changes after unzipping.

Solution
To resolve this issue, please follow these steps after unzipping the project:
    1. Remove the existing Core Data Model:
        - Open your project in Xcode.
        - Navigate to the Project Navigator and find the ListItemModel.xcdatamodeld file.
        - Right-click on the ListItemModel.xcdatamodeld file and select "Delete."
        - Choose "Move to Trash" to completely remove the file from your project.
    2. Re-add the Core Data Model:
        - Locate the ListItemModel.xcdatamodeld file in your unzipped project folder (outside of Xcode).
        - Drag and drop the ListItemModel.xcdatamodeld file back into the Xcode Project Navigator in the same location where it was originally.
Post-Fix Verification
After performing these steps, build and run your project again. The Core Data model should now load correctly, and the application should function as intended without any path issues.

Search Functionality Issue and Error Handling
Issue Description
When searching for a recipe by typing an ingredient and pressing the search button, there may be no visible change in the search results. However, the correct results appear when starting to delete the typed ingredient using the backspace key.

Error Handling for Incorrect Ingredients
If a user types an ingredient that does not match any recipes in the database, the application will display an error message. This helps to inform the user that the entered ingredient is not recognized and prompts them to try a different search term.
Image Selection Requirement for Saving
Functionality Description
In our application, an image must be selected before the save operation can be executed. This is an intentional design choice to ensure that no entries are saved without an associated image.
