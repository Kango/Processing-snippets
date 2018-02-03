

void keyPaintHelper(char InputKeyOfFunction) {

  // Building letters from sets of stars (*).

  char k = Character.toUpperCase(InputKeyOfFunction);
  letterSpacing=0;

  // Init complete letter with 
  bufferWritePosition=0; 
  buffer[bufferWritePosition + 0] = "         ";
  buffer[bufferWritePosition + 1] = "         ";
  buffer[bufferWritePosition + 2] = "         ";
  buffer[bufferWritePosition + 3] = "         ";
  buffer[bufferWritePosition + 4] = "         ";
  buffer[bufferWritePosition + 5] = "         ";
  buffer[bufferWritePosition + 6] = "         ";


  switch(k) {
  case 'A':
    buffer[bufferWritePosition + 0] = " ******  ";
    buffer[bufferWritePosition + 1] = " ******* ";
    buffer[bufferWritePosition + 2] = "   *   * ";
    buffer[bufferWritePosition + 3] = "   *   * ";
    buffer[bufferWritePosition + 4] = " ******* ";
    buffer[bufferWritePosition + 5] = " ******  ";
    buffer[bufferWritePosition + 6] = "         ";
    bufferWritePosition += 7;
    break;
  case 'B':
    buffer[bufferWritePosition + 0] = " ******* ";
    buffer[bufferWritePosition + 1] = " ******* ";
    buffer[bufferWritePosition + 2] = " *  *  * ";
    buffer[bufferWritePosition + 3] = " *  *  * ";
    buffer[bufferWritePosition + 4] = " ******* ";
    buffer[bufferWritePosition + 5] = "  ** **  ";
    buffer[bufferWritePosition + 6] = "         ";
    bufferWritePosition += 7;
    break;
  case 'C':
    buffer[bufferWritePosition + 0] = "  *****  ";
    buffer[bufferWritePosition + 1] = " ******* ";
    buffer[bufferWritePosition + 2] = " *     * ";
    buffer[bufferWritePosition + 3] = " *     * ";
    buffer[bufferWritePosition + 4] = " *     * ";
    buffer[bufferWritePosition + 5] = "  *   *  ";
    buffer[bufferWritePosition + 6] = "         ";
    bufferWritePosition += 7;
    break;
  case 'D':
    buffer[bufferWritePosition + 0] = " ******* ";
    buffer[bufferWritePosition + 1] = " ******* ";
    buffer[bufferWritePosition + 2] = " *     * ";
    buffer[bufferWritePosition + 3] = " **   ** ";
    buffer[bufferWritePosition + 4] = "  *****  ";
    buffer[bufferWritePosition + 5] = "   ***   ";
    buffer[bufferWritePosition + 6] = "         ";
    bufferWritePosition += 7;
    break;
  case 'E':
    buffer[bufferWritePosition + 0] = " ******* ";
    buffer[bufferWritePosition + 1] = " ******* ";
    buffer[bufferWritePosition + 2] = " *  *  * ";
    buffer[bufferWritePosition + 3] = " *  *  * ";
    buffer[bufferWritePosition + 4] = " *  *  * ";
    buffer[bufferWritePosition + 5] = " *     * ";
    buffer[bufferWritePosition + 6] = "         ";
    bufferWritePosition += 7;
    break;
  case 'F':
    buffer[bufferWritePosition + 0] = " ******* ";
    buffer[bufferWritePosition + 1] = " ******* ";
    buffer[bufferWritePosition + 2] = "    *  * ";
    buffer[bufferWritePosition + 3] = "    *  * ";
    buffer[bufferWritePosition + 4] = "    *  * ";
    buffer[bufferWritePosition + 5] = "       * ";
    buffer[bufferWritePosition + 6] = "         ";
    bufferWritePosition += 7;
    break;
  case 'G':
    buffer[bufferWritePosition + 0] = "  *****  ";
    buffer[bufferWritePosition + 1] = " ******* ";
    buffer[bufferWritePosition + 2] = " ** *  * ";
    buffer[bufferWritePosition + 3] = " ** *  * ";
    buffer[bufferWritePosition + 4] = " **** ** ";
    buffer[bufferWritePosition + 5] = " **** *  ";
    buffer[bufferWritePosition + 6] = "         ";
    bufferWritePosition += 7;
    break;
  case 'H':
    buffer[bufferWritePosition + 0] = " ******* ";
    buffer[bufferWritePosition + 1] = " ******* ";
    buffer[bufferWritePosition + 2] = "    *    ";
    buffer[bufferWritePosition + 3] = "    *    ";
    buffer[bufferWritePosition + 4] = " ******* ";
    buffer[bufferWritePosition + 5] = " ******* ";
    buffer[bufferWritePosition + 6] = "         ";
    bufferWritePosition += 7;
    break;

  case 'I':
    buffer[bufferWritePosition + 0] = "         ";
    buffer[bufferWritePosition + 1] = " *     * ";
    buffer[bufferWritePosition + 2] = " ******* ";
    buffer[bufferWritePosition + 3] = " ******* ";
    buffer[bufferWritePosition + 4] = " *     * ";
    buffer[bufferWritePosition + 5] = "         ";
    bufferWritePosition += 6;
    break;
  case 'J':
    buffer[bufferWritePosition + 0] = "  **     ";
    buffer[bufferWritePosition + 1] = " ***     ";
    buffer[bufferWritePosition + 2] = " *     * ";
    buffer[bufferWritePosition + 3] = " ******* ";
    buffer[bufferWritePosition + 4] = "  ****** ";
    buffer[bufferWritePosition + 5] = "       * ";
    buffer[bufferWritePosition + 6] = "         ";
    bufferWritePosition += 7;
    break;
  case 'K':
    buffer[bufferWritePosition + 0] = " ******* ";
    buffer[bufferWritePosition + 1] = " ******* ";
    buffer[bufferWritePosition + 2] = "   ***   ";
    buffer[bufferWritePosition + 3] = "  ** **  ";
    buffer[bufferWritePosition + 4] = " **   ** ";
    buffer[bufferWritePosition + 5] = " *     * ";
    buffer[bufferWritePosition + 6] = "         ";
    bufferWritePosition += 7;
    break;
  case 'L':
    buffer[bufferWritePosition + 0] = "         ";
    buffer[bufferWritePosition + 1] = " ******* ";
    buffer[bufferWritePosition + 2] = " ******* ";
    buffer[bufferWritePosition + 3] = " *       ";
    buffer[bufferWritePosition + 4] = " *       ";
    buffer[bufferWritePosition + 5] = " *       ";
    buffer[bufferWritePosition + 6] = "         ";
    bufferWritePosition += 7;
    break;
  case 'M':
    buffer[bufferWritePosition + 0] = " ******  ";
    buffer[bufferWritePosition + 1] = " ******* ";
    buffer[bufferWritePosition + 2] = "    **** ";
    buffer[bufferWritePosition + 3] = "  ****   ";
    buffer[bufferWritePosition + 4] = "  ****   ";
    buffer[bufferWritePosition + 5] = "    **** ";
    buffer[bufferWritePosition + 6] = " ******* ";
    buffer[bufferWritePosition + 7] = " ******  ";
    buffer[bufferWritePosition + 8] = "         ";
    bufferWritePosition += 9;
    break;
  case 'N':
    buffer[bufferWritePosition + 0] = " ******* ";
    buffer[bufferWritePosition + 1] = " ******* ";
    buffer[bufferWritePosition + 2] = "    **   ";
    buffer[bufferWritePosition + 3] = "   **    ";
    buffer[bufferWritePosition + 4] = " ******* ";
    buffer[bufferWritePosition + 5] = " ******* ";
    buffer[bufferWritePosition + 6] = "         ";
    bufferWritePosition += 7;
    break;
  case 'O':
    buffer[bufferWritePosition + 0] = "  *****  ";
    buffer[bufferWritePosition + 1] = " ******* ";
    buffer[bufferWritePosition + 2] = " *     * ";
    buffer[bufferWritePosition + 3] = " *     * ";
    buffer[bufferWritePosition + 4] = " ******* ";
    buffer[bufferWritePosition + 5] = "  *****  ";
    buffer[bufferWritePosition + 6] = "         ";
    bufferWritePosition += 7;
    break;

  case 'P':
    buffer[bufferWritePosition + 0] = " ******* ";
    buffer[bufferWritePosition + 1] = " ******* ";
    buffer[bufferWritePosition + 2] = "    *  * ";
    buffer[bufferWritePosition + 3] = "    *  * ";
    buffer[bufferWritePosition + 4] = "    **** ";
    buffer[bufferWritePosition + 5] = "     **  ";
    buffer[bufferWritePosition + 6] = "         ";
    bufferWritePosition += 7;
    break;

  case 'Q':
    buffer[bufferWritePosition + 0] = "  *****  ";
    buffer[bufferWritePosition + 1] = " ******* ";
    buffer[bufferWritePosition + 2] = " **    * ";
    buffer[bufferWritePosition + 3] = " **    * ";
    buffer[bufferWritePosition + 4] = "******** ";
    buffer[bufferWritePosition + 5] = "* *****  ";
    buffer[bufferWritePosition + 6] = "         ";
    bufferWritePosition += 7;

    break;
  case 'R':
    buffer[bufferWritePosition + 0] = " ******* ";
    buffer[bufferWritePosition + 1] = " ******* ";
    buffer[bufferWritePosition + 2] = "   **  * ";
    buffer[bufferWritePosition + 3] = "  ***  * ";
    buffer[bufferWritePosition + 4] = " ** **** ";
    buffer[bufferWritePosition + 5] = " *   **  ";
    buffer[bufferWritePosition + 6] = "         ";
    bufferWritePosition += 7;

    break;
  case 'S':
    buffer[bufferWritePosition + 0] = "  ** **  ";
    buffer[bufferWritePosition + 1] = " ** **** ";
    buffer[bufferWritePosition + 2] = " *  *  * ";
    buffer[bufferWritePosition + 3] = " *  *  * ";
    buffer[bufferWritePosition + 4] = " **** ** ";
    buffer[bufferWritePosition + 5] = "  ** **  ";
    buffer[bufferWritePosition + 6] = "         ";
    bufferWritePosition += 7;
    break;

  case 'T':
    buffer[bufferWritePosition + 0] = "       * ";
    buffer[bufferWritePosition + 1] = "       * ";
    buffer[bufferWritePosition + 2] = " ******* ";
    buffer[bufferWritePosition + 3] = " ******* ";
    buffer[bufferWritePosition + 4] = "       * ";
    buffer[bufferWritePosition + 5] = "       * ";
    buffer[bufferWritePosition + 6] = "         ";
    bufferWritePosition += 7;
    break;
  case 'U':
    buffer[bufferWritePosition + 0] = "  ****** ";
    buffer[bufferWritePosition + 1] = " ******* ";
    buffer[bufferWritePosition + 2] = " *       ";
    buffer[bufferWritePosition + 3] = " *       ";
    buffer[bufferWritePosition + 4] = " ******* ";
    buffer[bufferWritePosition + 5] = "  ****** ";
    buffer[bufferWritePosition + 6] = "         ";
    bufferWritePosition += 7;
    break;
  case 'V':
    buffer[bufferWritePosition + 0] = "   ***** ";
    buffer[bufferWritePosition + 1] = "  ****** ";
    buffer[bufferWritePosition + 2] = " **      ";
    buffer[bufferWritePosition + 3] = " **      ";
    buffer[bufferWritePosition + 4] = "  ****** ";
    buffer[bufferWritePosition + 5] = "   ***** ";
    buffer[bufferWritePosition + 6] = "         ";
    bufferWritePosition += 7;
    break;
  case 'W':
    letterSpacing=-6 ; // -6 for 'W'
    buffer[bufferWritePosition + 0] = "  ****** ";
    buffer[bufferWritePosition + 1] = " ******* ";
    buffer[bufferWritePosition + 2] = " **      ";
    buffer[bufferWritePosition + 3] = "  ****   ";
    buffer[bufferWritePosition + 4] = "  ****   ";
    buffer[bufferWritePosition + 5] = " **      ";
    buffer[bufferWritePosition + 6] = " ******* ";
    buffer[bufferWritePosition + 7] = "  ****** ";
    buffer[bufferWritePosition + 8] = "         ";
    bufferWritePosition += 9;
    break;
  case 'X':
    buffer[bufferWritePosition + 0] = " **   ** ";
    buffer[bufferWritePosition + 1] = " *** *** ";
    buffer[bufferWritePosition + 2] = "   ***   ";
    buffer[bufferWritePosition + 3] = "   ***   ";
    buffer[bufferWritePosition + 4] = " *** *** ";
    buffer[bufferWritePosition + 5] = " **   ** ";
    buffer[bufferWritePosition + 6] = "         ";
    bufferWritePosition += 7;
    break;
  case 'Y':
    buffer[bufferWritePosition + 0] = "     *** ";
    buffer[bufferWritePosition + 1] = "    **** ";
    buffer[bufferWritePosition + 2] = " ****    ";
    buffer[bufferWritePosition + 3] = " ****    ";
    buffer[bufferWritePosition + 4] = "    **** ";
    buffer[bufferWritePosition + 5] = "     *** ";
    buffer[bufferWritePosition + 6] = "         ";
    bufferWritePosition += 7;
    break;
  case 'Z':
    buffer[bufferWritePosition + 0] = " **    * ";
    buffer[bufferWritePosition + 1] = " ***   * ";
    buffer[bufferWritePosition + 2] = " * **  * ";
    buffer[bufferWritePosition + 3] = " *  ** * ";
    buffer[bufferWritePosition + 4] = " *   *** ";
    buffer[bufferWritePosition + 5] = " *    ** ";
    buffer[bufferWritePosition + 6] = "         ";
    bufferWritePosition += 7;
    break;
  case '.':
    buffer[bufferWritePosition + 0] = " **      ";
    buffer[bufferWritePosition + 1] = " **      ";
    buffer[bufferWritePosition + 2] = "         ";
    bufferWritePosition += 3;
    break;
  case ',':
    buffer[bufferWritePosition + 0] = "*        ";
    buffer[bufferWritePosition + 1] = "***      ";
    buffer[bufferWritePosition + 2] = " **      ";
    buffer[bufferWritePosition + 3] = "         ";
    bufferWritePosition += 4;
    break;
  case '\'':
    buffer[bufferWritePosition + 0] = "     *** ";
    buffer[bufferWritePosition + 1] = "     *** ";
    buffer[bufferWritePosition + 2] = "         ";
    bufferWritePosition += 3;
    break;
  case '?':
    buffer[bufferWritePosition + 0] = "      *  ";
    buffer[bufferWritePosition + 1] = "      ** ";
    buffer[bufferWritePosition + 2] = " * *   * ";
    buffer[bufferWritePosition + 3] = " * **  * ";
    buffer[bufferWritePosition + 4] = "    **** ";
    buffer[bufferWritePosition + 5] = "     **  ";
    buffer[bufferWritePosition + 6] = "         ";
    bufferWritePosition += 7;
    break;
  case '!':
    buffer[bufferWritePosition + 0] = "         ";
    buffer[bufferWritePosition + 1] = " * ***** ";
    buffer[bufferWritePosition + 2] = " * ***** ";
    buffer[bufferWritePosition + 3] = "         ";
    bufferWritePosition += 4;
    break;
  case '-':
    buffer[bufferWritePosition + 0] = "   **    ";
    buffer[bufferWritePosition + 1] = "   **    ";
    buffer[bufferWritePosition + 2] = "   **    ";
    buffer[bufferWritePosition + 3] = "         ";
    bufferWritePosition += 4;
    break;
  case ' ':
    buffer[bufferWritePosition + 0] = "         ";
    buffer[bufferWritePosition + 1] = "         ";
    buffer[bufferWritePosition + 2] = "         ";
    buffer[bufferWritePosition + 3] = "         ";
    bufferWritePosition += 4;
    break;

  default:
    // Error
    println ("Error 416 ");
    exit();
    break;
    //
  }//switch 
  //
}// func 
//