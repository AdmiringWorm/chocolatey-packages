# [<img src="https://cdn.jsdelivr.net/gh/AdmiringWorm/chocolatey-packages@7f25c1838154fe1d1a6d73a052e5d0c351f0fd76/icons/unit-test-boilerplate-generator.png" height="48" width="48" /> ![Unit Test Boilerplate Generator](https://img.shields.io/chocolatey/v/unit-test-boilerplate-generator.svg?label=Unit%20Test%20Boilerplate%20Generator&style=for-the-badge)](https://chocolatey.org/packages/unit-test-boilerplate-generator)

Generates a unit test boilerplate from a given C# class, setting up mocks for all dependencies and test outlines for all public methods.

Test frameworks supported:

- Visual Studio
- NUnit
- xUnit

Mock frameworks supported:

- Moq
- AutoMoq
- NSubstitute
- SimpleStubs
- Rhino Mocks

Dependency injection modes supported:

- Constructor injection via any IoC framework
- Property injection via Unity, Ninject or Grace

Right click an item in Solution Explorer and choose "Create Unit Test Boilerplate" .

![Before Screenshot](https://cdn.rawgit.com/AdmiringWorm/chocolatey-packages/97e1459ab29627e3f745789c45bed85ef3f67f29/automatic/unit-test-boilerplate-generator/screenshots/BeforeScreenshot.png)

This will create a test class in the same relative path as the class in a specified unit test project.
All the dependencies are mocked and saved as fields which are created fresh for each test via \[TestInitialize]. In addition, all public methods
on the tested class are set up with a test method outline:

![After Screenshot](https://cdn.rawgit.com/AdmiringWorm/chocolatey-packages/97e1459ab29627e3f745789c45bed85ef3f67f29/automatic/unit-test-boilerplate-generator/screenshots/AfterScreenshot.png)

Each mocking framework has its own pattern.
