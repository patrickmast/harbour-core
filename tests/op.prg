/*
 * Testing the operators-overloading feature
 *
 * Copyright 2000 Antonio Linares <alinares@fivetech.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; see the file LICENSE.txt.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301 USA (or visit https://www.gnu.org/licenses/).
 *
 * As a special exception, the Harbour Project gives permission for
 * additional uses of the text contained in its release of Harbour.
 *
 * The exception is that, if you link the Harbour libraries with other
 * files to produce an executable, this does not by itself cause the
 * resulting executable to be covered by the GNU General Public License.
 * Your use of that executable is in no way restricted on account of
 * linking the Harbour library code into it.
 *
 * This exception does not however invalidate any other reasons why
 * the executable file might be covered by the GNU General Public License.
 *
 * This exception applies only to the code released by the Harbour
 * Project under the name Harbour.  If you copy code from other
 * Harbour Project or Free Software Foundation releases into a copy of
 * Harbour, as the General Public License permits, the exception does
 * not apply to the code that you add in this way.  To avoid misleading
 * anyone as to the status of such modified files, you must delete
 * this exception notice from them.
 *
 * If you write modifications of your own for Harbour, it is your choice
 * whether to permit this exception to apply to your modifications.
 * If you do not wish that, delete this exception notice.
 *
 */

#include "hbclass.ch"

// You can overload operators with Harbour as C++ does!

PROCEDURE Main()

   LOCAL oCar := TCar():New( "Red", 2 )
   LOCAL oPetrol := NIL

   oCar += oPetrol

   HB_SYMBOL_UNUSED( oCar )

   RETURN

//

CREATE CLASS TCar

   VAR cColor
   VAR nDoors

   METHOD New( cColor, nDoors ) CONSTRUCTOR

   METHOD Sum( oObject ) OPERATOR '+'

ENDCLASS

METHOD New( cColor, nDoors ) CLASS TCar

   ::cColor := hb_defaultValue( cColor, "White" )
   ::nDoors := hb_defaultValue( nDoors, 4 )

   RETURN Self

METHOD PROCEDURE Sum( oObject ) CLASS TCar

   HB_SYMBOL_UNUSED( oObject )

   Alert( "+ has a special meaning and " + ;
      "functionality for TCar Class objects!" )

   RETURN
