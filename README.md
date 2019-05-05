# devops-demo

This repo demonstrates [git hooks](https://git-scm.com/docs/githooks) (specifically the pre-commit hook) and how they can be used. 
Git hooks are scripts that are built into git that can be executed before or after certain events. Some examples are 
* pre-commit
* post-commit
* pre-push

To assist us in demonstrating git hooks, we have used a finished example that was originally meant to teach about [building java 9 modules](https://guides.gradle.org/building-java-9-modules/). 
The project and its code we based our demonstration on can be found [here](https://github.com/gradle-guides/building-java-9-modules/tree/master/src/4-plugin)
This example project did not have any git hooks activated or any of the tools we describe in this readme implemented from the start. 

In this repo we have activated teh pre-commit hooks which means that before every commit, 
the static analysis tools [PMD](https://pmd.github.io/), [SpotBugs](https://spotbugs.github.io/) and [checkstyle](http://checkstyle.sourceforge.net/) will be executed on the modified subprojects. 

It can also be configured to run unit & mutation tests ([pitest](http://pitest.org/)) before every commit in addition to the static analysis. 

Third party projects/programs can also be installed to utilise git hooks. One example is [lolcommits](https://github.com/lolcommits/lolcommits) which takes a picture with the webcam on every commit. 

The reports of each of the tools are also uploaded to an aws s3 bucket and statically hosted as a simple website. 

## Setup

To activate a git hook, all that needs to be done is renaming the desired hook in `.git/hooks/<hook>.sample` 
to `.git/hooks/<hook>`

For our configuration of the hook, the following is needed: 
#### Requirements
* [Gradle](https://gradle.org/) *version* > 5.0
* [JDK](https://www.oracle.com/technetwork/java/javase/downloads/index.html) *version* > 8.0
* [PMD](https://pmd.github.io/)
* [SpotBugs](https://spotbugs.github.io/)
* [checkstyle](http://checkstyle.sourceforge.net/)
* [pitest](http://pitest.org/)
* [awscli](https://aws.amazon.com/cli/)

1. To configure the pre-commit hook: edit setupenvironment.sh and run it as 
    ```
    . ./setupenvironment.sh                            // Don't forget the first dot.
    ``` 

2. Configure the url to the s3 bucket in generate-html.sh to upload to a bucket you have access to. 

## Running the tools and program (manually)
* To run the program 
    ````bash
    ./gradlew run
    ````
* To run PMD 
    ````bash
    ./gradlew pmdMain
    ````
* To run SpotBugs 
    ````bash
    ./gradlew spotbugsMain
    ````
* To run checkstyle
    ````bash
    ./gradlew checkstyleMain
    ````
* To run the unit tests 
    ````bash
    ./gradlew test
    ````
* To run pitest 
    ````bash
    ./gradlew pitest
    ````
