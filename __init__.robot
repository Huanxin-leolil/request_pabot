*** Settings ***
Suite Setup       Setup
Library           RequestsLibrary
Library           pabot.PabotLib
Resource          resource.robot

*** Keywords ***
Setup
    # Create only one session for all threads.
    Acquire Lock    setup
    Run Only Once    Create parallel session
    Release Lock    setup
    ${parallelsession}    Get Parallel Value For Key    ParallelSession
    # Set global variables for the session of the current thread
    Set Global Variable    ${session}    ${parallelsession}

Create parallel session
    # Set the session to all threads can be shared.
    create session    github    ${url}
    Set Parallel Value For Key    ParallelSession    github
