*** Settings ***
Suite Setup       Setup
Library           RequestsLibrary
Library           pabot.PabotLib
Resource          resource.robot

*** Keywords ***
Setup
    # Create only one session for all threads.
    Run Only Once    Create parallel session
    ${parallelsession}    Get Parallel Value For Key    ParallelSession
    # Set global variables for the session of the current thread
    Set Global Variable    ${session}    ${parallelsession}
    Acquire Lock    setup
    Release Lock    setup

Create parallel session
    # Set the session to all threads can be shared.
    create session    github    ${url}
    Set Parallel Value For Key    ParallelSession    github
