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

#ifndef __VIEWS_DIR_H
#define __VIEWS_DIR_H

#include <dirent.h>

typedef struct _directory direct;
direct *directory;

struct _directory
{
        char *name;
        direct *next;
};

direct *add_name(direct *dir, char *name);
void print_names(direct *dir);
char *search(direct *dir, const char *name);
direct *read_dir(char *dirname);
char *getdir(char *filename);

#endif
