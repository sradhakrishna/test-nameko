# About this repository

This repository contains code to demonstrate the issue with debugging nameko code in Visual Studio Code. 

# Reproduce the issue

Environment: VSCode 1.64.0

1. Clone this repo
2. Open Visual Studio Code, and open the workspace.code-workspace file. 
3. Command Palette -> Tasks: Manage Automatic Tasks in Folder -> Select Allow Automatic Tasks in Folder
4. Close and Reopen Visual Studio Code.
5. The automatic tasks should now run and setup a virtualenv, and install both Sources and Tests requirements. Pytest should also be configured and setup. pytest.ini and the requirements file in Tests/requirements.txt should provide information about how pytest is setup.
6. On the Testing pane, test_event_interface should be visible. 
7. Kick off debugging the test by hitting Debug Test icon
8. The debugger will hang.

