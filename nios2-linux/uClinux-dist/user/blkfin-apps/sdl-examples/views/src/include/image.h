/* views - view images exclusive with SDM
* Copyright (C) cappa <cappa@referee.at>
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public License
* as published by the Free Software Foundation; either version 2
* of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
*/

#ifndef __VIEWS_IMAGE_H
#define __VIEWS_IMAGE_H

const char current[1024];
int fs;

void sdlerror(void);
void settitle(const char *format, ...);
void setdisplay(SDL_Surface *image);
int chkkey(SDL_KeyboardEvent key);
SDL_Surface *loadimage(char *filename, int direction);

#endif
