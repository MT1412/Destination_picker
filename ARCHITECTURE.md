## Stack

- Haskell
- Nix
- IHP (Integrated Haskell Platform)
- PostgreSQL, although not in use currently


## Project structure
The IHP framework, as well as this app, follows the model-view-controller pattern:
    Model:      Application -> calculation to show in view
    View:       Web/View -> submit calls calculateAction
    Controller: Web/Controller -> calculateAction will render calculateView based on calculation

### File structure
Top level structure:
devcontainer: remote container files
Github workflow: pipeline to build and test
rest of the files organised as standard IHP project: https://ihp.digitallyinduced.com/Guide/architecture.html

#### IHP project:
The IHP project structure is as follows:

```
Application/
    Domain/         -> main domain logic (calculation)
    Helper/         -> interface to the controller
Config/             -> configuration files for nix package manager, ihp and haskell app
static/             -> images, css and javascript
Test/               -> (domain) test files
Web/
    Controller/     -> application controller (actions)
    View/           -> application views and layout
    <other files>   -> routing
<other files>       -> other configurations, Main, etc
```