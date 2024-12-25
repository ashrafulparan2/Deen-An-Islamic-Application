
<h1 align="center"> <img height='50' alt='icon' src='./assets/logo.png'/>  DEEN - An Islamic App</h1><p align="center">It’s an Islamic application that contains quran, hadees, azkar.</b>. <br> <b>Design & Developed in Flutter</b>.</p>

![Banner](assets/banner.png)

![Flutter version](https://img.shields.io/badge/Flutter-Version%202.5.0-blue) ![Dart version](https://img.shields.io/badge/Dart-Version%202.14.1-blue) ![Deen Version](https://img.shields.io/badge/Deen-Version%201.0.0-green) ![Open Source](https://img.shields.io/badge/Open%20Source-%E2%9D%A4-red?style=flat)

## Installation steps

Open CMD where you want to clone the project & run the following commands

```
git clone https://github.com/ashrafulparan2/Deen.git
cd Deen
flutter pub get
flutter run
```

## Splash Screen
Splash screens provide a simple initial experience while Android app loads. They set the stage
of an application, while allowing time for the app engine to load the application. Our app also
includes a splash screen. Through splash screen users can anticipate a smooth transition, setting
the stage for an optimal and engaging app experience.

![alt text](./assets/images/documentation/./assets/images/documentation/image.png)

Once the first splash screen finishes, a nice-looking second one comes up, adding a bit of flair
before quickly switching to the home page in just one second.

![alt text](./assets/images/documentation/image-1.png)

## Home Page
Users can easily access all critical features through the homepage's integrated design. A
countdown at the top of the page indicates when the next prayer time is. The collection portion
exhibits numerous application functionalities.
![alt text](./assets/images/documentation/image-2.png)

If we scroll this page hadees of the day and image of the day will be shown. The respective
references of hadees and image is also given.

![alt text](./assets/images/documentation/image-3.png)

## Quran Page
In this page the Holy Quran is illustrated. The page has two section which is Surah and Juz.
User can read Surah and also, they can read according to Juz.

![alt text](./assets/images/documentation/image-4.png)

After clicking on any surah, the details of that specific surah will be displayed in the next page.

![alt text](./assets/images/documentation/image-5.png)

Zakat Calculator:
In this page zakat calculator was implemented. There are three text boxes in this page for taking
input from user. From total saving, total loan and total gold amount the amount of zakat was
calculated in taka. If total amount of asset crosses the amount of nisab then the user has to pay
the zakat.


![alt text](./assets/images/documentation/image-6.png)


## Names of Allah
This page contains the ninety-nine names of Allah (Al Asma ul Husna). User can also know
the meaning of that name by clicking on a particular name.


![alt text](./assets/images/documentation/image-7.png)


Clicking on a specific name will reveal the details associated with that particular name.

![alt text](./assets/images/documentation/image-8.png)

## Dua Page
In this page dua of different kinds of surah are illustrated. User can recite these duas in their
free time.

![alt text](./assets/images/documentation/image-9.png)

## Tasbih Page
In this page several kinds of dua are illustrated at first. User can select any dua for counting
tasbih. Required count for each round is also given which increase the user experience.

![alt text](./assets/images/documentation/image-10.png)

If we click any dua then the tasbih counter will be displayed. We can also reset the value of
tasbih counter.

![alt text](./assets/images/documentation/image-11.png)

## Prayer Time Page
In this page prayer times are illustrated according to user’s location. If user change their
location prayer time will also change according to their location.
![alt text](./assets/images/documentation/image-12.png)

## Qiblah Compass Page
In this page qiblah compass was implemented. The direction of the qiblah is always directed
to the qiblah according to the user’s location.

![alt text](./assets/images/documentation/image-13.png)

## Hizri Calendar
In this page the calendar is displayed in both English and Hizri format. This page was
implemented using hijri library.

![alt text](./assets/images/documentation/image-14.png)

## Nearest Mosque Finder
In this page users can find the nearest mosque from their location. All the mosque in 5km radius
is shown in this page. Current location of the user is fetched using geo locator of pub get library.
All the mosque within the region is shown using a red marker. The information of mosque will
be updated if the location of user changed.
![alt text](./assets/images/documentation/image-15.png)

## Personal Tracker
In this page user can track the information of the tasbih, hadees, aya, surah and dua. All of these
can be added to this page by clicking on the bookmark sign. User can also delete the respective
information at any time.

![alt text](./assets/images/documentation/image-16.png)


## User Tracker
This special feature requires user registration, ensuring exclusive access to a unique page
within our application. This special page employs an innovative approach, revealing the
anonymous locations of all users on a map. This strategic use of geo locator library offers users
a comprehensive overview of the crowd density around mosques, facilitating a better
understanding of potential congestion. The functionality of this page is made possible by the
seamless integration of geo locator services. During the user's login process, the application
captures and stores their location information, ensuring real-time accuracy. This gathered data
is then securely transmitted to the database, forming the foundation for the dynamic display of
user locations on the dedicated page. By leveraging the power of geo locator library, our
application goes beyond conventional offerings, empowering users with a practical tool to
measure crowd levels around mosques. This unique feature not only enhances user engagement
but also contributes to a more informed and efficient navigation experience, aligning with our
commitment to providing innovative solutions within the realm of our application.

![alt text](./assets/images/documentation/image-17.png)

## How to contribute

- **Fork the repository and clone it locally**. Connect your local to the original “upstream” repository by adding it as a remote. Pull in changes from “upstream” often so that you stay up to date so that when you submit your pull request, merge conflicts will be less likely. (See more detailed instructions here.)
- **Create a branch** for your edits.
- **Reference any relevant issues** or supporting documentation in your PR (for example, “Closes #37.”)
- **Include screenshots of the before and after** if your changes include differences in HTML/CSS. Drag and drop the images into the body of your pull request.
- **Test your changes!** Run your changes against any existing tests if they exist and create new ones when needed. Whether tests exist or not, make sure your changes don’t break the existing project.
- **Contribute in the style of the project** to the best of your abilities. This may mean using indents, semi-colons or comments differently than you would in your own repository, but makes it easier for the maintainer to merge, others to understand and maintain in the future.

## Built With

- [Android Studio](https://developer.android.com/studio/install) - How to install Android Studio
- [Flutter](https://flutter.dev) - Flutter Official website

