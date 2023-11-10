<a id="readme-top"></a>
<a name="readme-top"></a>

<div align="center">
  <h1>BookHouse</h1>
  <h2>📖 Final Capstone back end App</h2>
</div>

# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [📖 House Booking (Backend) ](#-house-booking-backend-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [🚀 Live Demo ](#-live-demo-)
  - [🎬 Kanban Board ](#-kanban-board-)
  - [The learning objective of this project are](#the-learning-objective-of-this-project-are)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Database Setup.](#database-setup)
    - [Usage](#usage)
    - [Tests ](#tests-)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [📝 License ](#-license-)

<!-- PROJECT DESCRIPTION -->

# 📖 House Booking (Backend) <a id="about-project"></a>

**House Booking** is a website that offers hoouse booking and reservation services for travelers, providing a convenient way to find and book accommodations. You can select available houses for a graphic list on the home page of the website, or you can just click on the reserve menu item and see the full list of available rooms. You can find the repository for the [front end](https://github.com/Kgomotso196/House-Booking-Frontend) of this project here.

Backend is implement as API-only. The front end is implemented utilizing the React framework.

-  The backend Rails app is implemented as API-only. The application starts by fetching the `users` method on the backend, if the backend is available then the user will login by making a query to `users/new_session`.

-  The house controller provides an `index` method to get all the data for house, and a `show` method to get details about a specific house. The `destroy` method deactivates the house when the user sends a delete query by clicking on delete.

-  The reservation controller also provides `index` methods. Index is used to get a list of all reservations made. 
 
## 🛠 Built With <a id="built-with"></a>

### Tech Stack <a id="tech-stack"></a>

<details>
  <summary>Ruby on Rails</summary>
  <ul>
    <li><a>https://rubyonrails.org/</a></li>   
  </ul>
</details>

<!-- Features -->

### Key Features <a id="key-features"></a>

- **Ability to see the featured house on the homepage**
- **The ability to reserve houses based on selecting the date and room name**
- **The ability to add houses to the database**
- **The ability to delete houses**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🚀 Live Demo <a id="live-demo"></a>

Live demo for the website [Coming Soon]().

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🎬 Kanban Board <a id="kanban-board"></a>

Link to the [Kanban Board](https://github.com/users/Kgomotso196/projects/4/views/1)

## API Documentation <a id="kanban-board"></a>
Link to the [API Document](http://127.0.0.1:3000/api-docs/index.html)

We are a team of four that are deeply enthusiastic about their roles. We applied efficient strategies to successfully finish the project and collaborated to resolve any issues or disagreements. Consistent communication and the equitable distribution of tasks among us were key elements of our commitment to delivering our best work. This sets us apart as dedicated professionals.

## The learning objective of this project are

- Create ruby api back end app
- Connect react front end app to rails back end
- Use API end point to get data
- Fetch data from the API


<!-- GETTING STARTED -->

## 💻 Getting Started <a id="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project, you need to:

- Install Ruby
- Install Rails
- Install Posgresql
<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Setup

Clone this repository to your desired folder:

``` 
  git clone https://github.com/Kgomotso196/House-Booking-Backend.git 
```

### Install

Install this project with these commands:

```
  cd House-Booking-backend
  bundle install
  rails db:create
  rails db:migrate
  rails db:migrate RAILS_ENV=test
  ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Database Setup.

Before creating database, you have to configure the master key for your project. This can be done in two ways.

1. **Using our own master key that we have provided**
cd into the project folder and in your terminal run

``` 
rails rake:secret

```
- This command will generate a master.key file and inside that file replace the key with the one shown below.

**[f387ccf0b4eebd334dc8725a1cb9573]**

- Proceed to creating db.

2. **Generating your own master Key**

- Remove config/master.key and config/credentials.yml.enc if they exist.
- Run in the terminal: EDITOR=code rails credentials:edit 
- Close the editor that opens.
- This command will create a new master.key and credentials.yml.enc if they do not exist.

- After this proceed to creating db with:
```
  rails db:create
  rails db:migrate
  ```
  
<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Usage
 
To run the project execute the following command:

``` 
 rails s
```

or

```
./bin/dev
```

- You can use the following emails and passwords from seeded data to login from the frontend.

for a Normal User

```
user1 = User.create(
  name: 'Jane Smith',
  email: 'jane@example.com',
  password: 'password456',
  password_confirmation: 'password546'
)
```
<p align="right">(<a href="#readme-top">back to top</a>)</p>

###  Tests <a id="run-tests"></a>

To run the tests for models and requests, execute the following command:

```
rspec ./spec/models

```
 
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->
## 👥 Authors <a id="authors"></a>  
 
👤 : **Kgomotso (Troos) Nacane**

- GitHub: [@githubhandle](https://github.com/Kgomotso196/)
- Twitter: [@twitterhandle](https://twitter.com/t_r_o_o_s/)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/kgomotso-nacane/)
 

👤 **Tonny Tei**

- GitHub: [Tonny](https://github.com/teitonny/)
- Linkedin: [Tonny](https://twitter.com/TonnyTei/)
- Twitter: [Tonny](https://www.linkedin.com/in/tonny-tei-38a4771a0/)

👤 **Okongo Derrick**

- GitHub: [Derrick](https://github.com/derrick1451/)
- Twitter: [Derrick](https://twitter.com/DerrickHayle/)
- LinkedIn: [Derrick](https://www.linkedin.com/in/okongo-derrick/)

👤 : **John Murianki**

- GitHub: [@githubhandle](https://github.com/tjay1760)
- Twitter: [@twitterhandle](https://twitter.com/TjayPod)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/john-murianki-thiongo)
 
<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a id="future-features"></a> 
 
- **[Payment Integration into the System]**
- **[Add email confirmation]**
 
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a id="contributing"></a>

Contributions, issues, as well as feature requests are welcome!

Feel free to check the [issues page](https://github.com/Kgomotso196/House-Booking-Backend/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->
## ⭐️ Show your support <a id="support"></a>

If you like this project, kindly leave a comment below and share it with
someone who enjoys coding! or still, give us a ⭐️!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->
## 🙏 Acknowledgments <a id="acknowledgements"></a>
 
-  Thanks to our amazing team members and coding partners for their invaluable contributions and dedication. 
-  The Design reference for the website belongs to [Murat Korkmaz](https://www.behance.net/muratk). You can find the reference [here](https://www.behance.net/gallery/26425031/Vespa-Responsive-Redesign)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->
 
## 📝 License <a id="license"></a> 

This project is [MIT](./MIT.md) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>




