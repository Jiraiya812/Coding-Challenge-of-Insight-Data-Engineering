#!/bin/bash
matlab -nodisplay -nodesktop -r "run ./src/words_tweeted.m; quit"
matlab -nodisplay -nodesktop -r "run ./src/median_unique.m; quit"
