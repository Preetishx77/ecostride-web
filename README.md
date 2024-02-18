# ecostride-web

<h1 align="center"> Eco Stride 🍀 </h1>
<p align="center"><b>Sustaining the Sustain-enablers 🍀🌲 </b></p>
<p align="center">A <b>Google DSC Solution Challenge</b> submission</p>

  
<p align="center">Our platform addresses India's imminent carbon emission regulations, offering proactive solutions for individuals and businesses. Enabling early carbon offset minting and trading, we empower users to reduce their carbon footprint while participating in the emerging carbon market. With intuitive features, our cross platform web & mobile platforms facilitate collaboration between NGOs, planters, and users, promoting environmental awareness and driving meaningful contributions to climate change mitigation efforts.</p>

  

### Video Submission

  

You can checkout our video submission demo on youtube by clicking on the thumbnail below.

  

<a href="http://www.youtube.com/watch?v=dinzfBUDqi0">

<img src="https://img.youtube.com/vi/dinzfBUDqi0/maxresdefault.jpg" width="500px">

</a>

  
### Tech Stack
1. Flutter
2. Firebase
3. NodeJS
4. React
5. Vite 
6. Ant Design
7. Vercel
  

### Project Info

The contents in this project follow the following structure, where all views are containerised into screens.

  

```
├───controllers

|

├───data

|

├───helpers

|

├───pages

│ ├───tools

│ ├───learn

│ ├───home

│ ├───auth

│ ├───home

|

├───widgets


```
  

#### Designs

  

All the design/mockups for the app have been referenced from multiple open internet designs and customized for purpose

  

### Description

Our solution comprises two distinct platforms tailored to meet the needs of different stakeholders in carbon offsetting:

1. Web Platform for NGOs:

NGOs can easily sign up and utilize our web platform to create campaigns aimed at raising funds for specific environmental projects. Through intuitive tools, NGOs can set fundraising goals for their campaigns and gain insights into the potential carbon credits generated from their initiatives, quantifying the credits they can generate before hand. This platform serves as a centralized hub for NGOs to efficiently organize and quantify, get rewarded from their carbon offsetting efforts.

2. App Platform for Industries and Users:

For industries and individual users seeking to offset their carbon footprint, they can browse through ongoing campaigns initiated by NGOs, contribute funds towards their chosen projects, and monitor the progress of their contributions. Upon the successful completion of campaigns, users receive relevant carbon credits proportional to their contributions, enabling them to actively participate in carbon offsetting initiatives while supporting environmental sustainability efforts.

- Our user ( individual / industries) faced solution mainly consists of a Flutter based mobile app. We wanted our solution to be available to our wide set of users all the time on their fingertips, that's why we picked up to build an mobile app using flutter.

- For the backend, we build an Node JS monolithic server with the database layer mostly relied on Firebase due to the quick setup and smooth CRUD operations.  

- For storing the different types of data including NGO campaigns, user payments, user data, NGO signups and various data regarding carbon credits we chose Cloud Firestore as it a noSQL database that enabled us to modify and upgrade the schemas as and when needed without a large refractor.

- For authentication on the web layer, we used Sign In with Google as it is fast and secure and doesnt require remembering ID, Password. 

- For handling payments, we used Razorpay SDK, which allowed us to accept payments for NGO campaign contributions using Google Pay.

- For Displaying campaign location to the users, we have integrated Google Maps API.

  

## Setup

### Flutter App

##### Clone the repository

```bash


```

##### Move to the desired folder

```bash



```

  

##### To run the app, simply write

```bash

flutter run

```

# About


### Problem Statement:
India currently lacks official regulations mandating carbon emission restrictions, despite being home to one of the world's largest Voluntary Carbon Markets. As discussions arise regarding the implementation of such laws by 2026, a significant gap exists in the market for managing carbon credits and emissions. Without preemptive measures, the impending regulations could lead to chaos and delays in carbon credit ownership, hindering efforts to mitigate carbon emissions effectively.

### Alignment with UN Climate Action Goal 13:
Our product aligns closely with United Nations Sustainable Development Goal 13: Climate Action. Goal 13 aims to combat climate change and its impacts by promoting urgent actions to mitigate greenhouse gas emissions and build resilience to climate-related hazards. By providing a platform for early carbon offset minting and trading, our product contributes directly to reducing carbon emissions, fostering environmental sustainability, and supporting global climate action efforts.

### Need for Our Product:
There is a pressing need for a product like ours to address the imminent challenges posed by the lack of carbon emission regulations in India. As discussions on mandating laws progress, businesses, individuals, and organizations require a reliable platform to manage and trade carbon offsets efficiently. Our product fills this critical gap by offering a streamlined solution for carbon offsetting, enabling stakeholders to proactively reduce their carbon footprint and participate in the emerging carbon market. By providing accessibility, transparency, and accountability, our platform empowers users to contribute effectively to climate change mitigation while aligning with international climate action goals.

  

##### Made with ♥ by Team Eco Stride
