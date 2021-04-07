# iOS-PokemonSelector

## Introduction
This is a capstone project for the C964 course provided by WGU. 

## Overview
iOS-PokemonSelector is an app that will select the best suited pokemon based on your answers to selected questions. There are a total of 6 questions that the user may answer. Each question has a weight slider which the user can use to add importance level to an answer. For example if the user values resistance to a certain damage type, they can increase the weight for that question. 
Overall, this project incorporates:

- SwiftUI
- CSV parsing
- Model View ViewModel (MVVM)
- NavigationView + NavigationLink transitions
- User input processing

## Getting Started
Unfortunatley GitHub does not allow an upload of 100+ files or anything greater than 20mb. If you wish to include the image dataset in the application, you will have to download the dataset yourself. 

### Prerequisites
- A Mac running macOS Catalina (beta)
- Xcode 11 (beta) or newer
- Download the Pokemon image dataset from https://www.kaggle.com/kvpratama/pokemon-images-dataset/download

### Installation
1. Clone or download the project to your local machine
2. Double click `C964.xcodeproj` in project root, or open the project's root in Xcode by pressing CMND + O and selecting project's root folder. 
3. Unzip the downloaded image set to `C964>C964>Assets>Assets.xcassets.`.  
4. Run the simulator with any selected iOS simulated device.

#### Notes
- When the application attempts to display the image of a pokemon, it will search for the name of the image through the Assets folder. The image dataset we use named the images to the coresponding pokemon's PokeDex number. However, the dataset may have some images titled as '208-mega.jpg' instead of just '208.jpg'. This will throw an error as image '208.jpg' does not exist. To fix this, go through the dataset in XCode by going to `Assets>Assets.xcassets`, drop down the `pokemon` folder, and make duplicates of any pokemon image that doesn't have an image in the 'xxx.jpg' format. 

## Acknowledgements
Pokemon stats and images were derived from:

- [Images] -> https://www.kaggle.com/kvpratama/pokemon-images-dataset?select=pokemon_jpg
- [Data] -> https://www.kaggle.com/rounakbanik/pokemon
