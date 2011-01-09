## Copyright (C) 2010 Kai Habel
##
## This file is part of Octave.
##
## Octave is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or (at
## your option) any later version.
##
## Octave is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with Octave; see the file COPYING.  If not, see
## <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn  {Function File} {@var{dirname} =} uigetdir ()
## @deftypefnx {Function File} {@var{dirname} =} uigetdir (@var{init_path})
## @deftypefnx {Function File} {@var{dirname} =} uigetdir (@var{init_path}, @var{dialog_name})
## Open a GUI dialog to select a directory. If @var{init_path} is not given
## the current working directory is used. @var{dialog_name} optionally  be used to
## customize the dialog title.
## @end deftypefn

## Author: Kai Habel

function dirname = uigetdir (init_path = pwd, dialog_name = "Choose directory?")

  if (nargin > 2)
    print_usage ();
  endif

  if (!ischar(init_path) || !ischar(name))
    error ("uigetdir: INIT_PATH and DIALOG_NAME must be string arguments");
  endif
  

  if (any (strcmp (available_backends(), "fltk")))
      if (!isdir (init_path))
        init_path = fileparts (init_path);
      endif
      dirname = __fltk_uigetfile__ ("", dialog_name, init_path, [240, 120], "dir");
  else
    error ("uigetdir: fltk backend required.");
  endif

endfunction


%!demo 
%! uigetdir(pwd, "Select Directory")
