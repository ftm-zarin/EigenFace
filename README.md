# Eigenfaces for Facial Recognition

This project implements the concept of eigenfaces for facial recognition using MATLAB. It includes visualizations of the faces dataset, PCA to derive eigenfaces, and reconstructions of faces using a subset of eigenfaces.

## Prerequisites

- MATLAB
- Yale B dataset
- `allFaces.mat` file (constructed from the Yale B dataset)

## Preparing the Dataset

1. **Download the Yale B Dataset:**
   - The dataset can be downloaded from [Yale B Database](http://vision.ucsd.edu/extyaleb/).
   
2. **Construct the `allFaces.mat` File:**
   - Extract the downloaded dataset.
   - Convert the images into a matrix where each column represents a flattened image and save it as `allFaces.mat`.
   - The `allFaces.mat` file should contain the following variables:
     - `faces`: A matrix where each column is a vectorized face image.
     - `nfaces`: A vector containing the number of images per person.
     - `n`: The height of each face image.
     - `m`: The width of each face image.

## Scripts Overview

### eigenface_1.m

This script visualizes the faces dataset and provides an overview of the data.

#### Features:

1. **Load and Prepare Data:**
   - Loads the data from `allFaces.mat`, containing faces of 38 individuals.

2. **Display All Faces:**
   - Combines all faces into a single grid image and displays it.
   - **Figure 1:** Shows the first image of each of the 36 training individuals under direct light.

3. **Display Individual Faces:**
   - Displays different images taken from specific individuals under various lighting and angles.
   - **Figure 2:** Visualizes several images for selected individuals.

The dataset is large, aiming to use SVD decomposition to learn how to reduce the dimensions of images with minimal cost and computations.

### eigenface_2.m

This script performs PCA on the facial data to derive eigenfaces and uses these eigenfaces for facial reconstruction and clustering.

#### Features:

1. **Train Data:**
   - Uses the images of the first 36 individuals for training.

2. **Compute Average Face:**
   - Calculates and displays the average face.
   - **Figure 1:** Shows the average face of the training data.

3. **Compute SVD:**
   - Subtracts the average from the data and computes SVD to get eigenfaces.
   - **Figure 2:** Displays the first 50 eigenfaces calculated.

4. **Face Reconstruction:**
   - Uses eigenfaces to reconstruct the face of a new individual (37th person).
   - **Figure 3:** Shows the test face of the 37th individual.
   - **Figure 4:** Reconstructs the face for various `r` values, demonstrating how increasing `r` improves the accuracy of the reconstructed image.
   
5. **Face Clustering:**
   - Projects faces of two selected individuals into the PCA space and plots their coordinates to visualize clustering.
   - **Figure 5:** Shows two faces (persons 2 and 7) that will be examined for clustering.
   - **Figure 6:** Clusters the faces of the two individuals, showing that they can be distinctly identified.



## Code Structure

- **`eigenface_1.m`**
  - Loads and visualizes the faces dataset.
  - Combines all faces into a single grid.
  - Displays individual faces for each person in the dataset.

- **`eigenface_2.m`**
  - Loads the faces dataset and computes the average face.
  - Performs SVD to compute eigenfaces.
  - Visualizes the average face and the first few eigenfaces.
  - Reconstructs a test face using a varying number of eigenfaces.
  - Projects specific faces into the PCA space and visualizes their coordinates.

## Notes

- Ensure `allFaces.mat` is present in the directory.
- The dataset should have variables for faces, number of faces (`nfaces`), and their dimensions (`n`, `m`).

---

Enjoy working with eigenfaces! If you have any questions or issues, feel free to open an issue or contact me.

---
