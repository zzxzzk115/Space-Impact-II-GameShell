#ifndef SAVES_H
#define SAVES_H

#include <SDL.h>
#include <stdio.h>
#include <stdlib.h>

/* A mentési funkciók leírása a saves.c-ben találhat?*/
void ReadSavedLevel(Uint8*);
void ReadTopScore(unsigned int*);
void SaveLevel(Uint8);
void PlaceTopScore(unsigned int*, Uint16);
void FillFileName(char*, Uint16);

#endif /* SAVES_H */
