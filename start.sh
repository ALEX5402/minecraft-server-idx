#!/bin/bash
screen -S playit -dm bash -lc ./playit 
cd server
java -Xms29G -Xmx29G -jar server.jar