#include <stdio.h>
#include <assert.h>
#include <stdlib.h>

/* This is skeleton code for reading characters from 
standard input (e.g., a file or console input) one by one until 
the end of the file (EOF) is reached. It keeps track of the current 
line number and is designed to be extended with additional 
functionality, such as processing or transforming the input data. 
In this specific task, the goal is to implement logic that removes 
C-style comments from the input. */

// Code: Inside code
// Poss_comm: Possible state to become a comment (i.e. starts with '/')
// Single_comm, Multi_comm: Single line comment, Multi line comment (i.e. inside //, /*)
// In_string, In char: Inside String or char (i.e. inside "", '')
// END: END of file
enum DFAState {Code, Poss_comm, Single_comm, Multi_comm, In_string, In_char, END};

/* 
Input: Input.c file
Output: Replace Input Comments with ' ' (i.e. Decommenting), # of lines preserved
Error: If Input.c file has unterminated comment
*/
int main(void)
{
  // ich: int type variable to store character input from getchar() (abbreviation of int character)
  int ich;
  // line_cur & line_com: current line number and comment line number (abbreviation of current line and comment line)
  int line_cur, line_com;
  // ch: character that comes from casting (char) on ich (abbreviation of character)
  // ch_before: character just before ch
  char ch;
  char ch_before;

  line_cur = 1;
  line_com = -1;

  enum DFAState state = Code;

  // This while loop reads all characters from standard input one by one
  while (1) {
	int got_eof = 0;

    ich = getchar();

	// prints error if comment is unterminated
    if (ich == EOF)	{
		if (state == Single_comm || state == Multi_comm){
			fprintf(stderr, "Error: line %d: unterminated comment\n", line_com);
			return (EXIT_FAILURE);
		}
		else
			return (EXIT_SUCCESS);
	}

    ch = (char)ich;
    
	switch (state){
		case Code:
			if (ch != '/') fprintf(stdout,"%c", ch);

			if (ch == '/') state = Poss_comm;
			if (ch == '\"') state = In_string;
			if (ch == '\'') state = In_char;

			break;
		//Possible state to become a comment
		case Poss_comm:
			if (ch == '/'){
				line_com = line_cur;
				fprintf(stdout, "%c", ' ');
				state = Single_comm;
			}
			else if (ch == '*'){
				line_com = line_cur;
				fprintf(stdout, "%c", ' ');
				state = Multi_comm;
			}
			else {
				fprintf(stdout, "%c", '/');
				fprintf(stdout, "%c", ch);
				state = Code;
			}
			break;
		//Inside Singleline comment, doesn't print anything until get out of comment.
		case Single_comm:
			if (ch == '\n'){
				fprintf(stdout, "%c", '\n');
				state = Code;
			}
			break;
		//Inside Multiline comment, only prints '\n'for line preserving.
		case Multi_comm:
			if (ch == '\n') fprintf(stdout, "%c", '\n');
			if (ch_before == '*' && ch == '/') state = Code;

			break;
		case In_string:
			fprintf(stdout, "%c", ch);
			if (ch == '\"') state = Code;
			break;
		case In_char:
			fprintf(stdout, "%c", ch);
			if (ch == '\'') state = Code;
			break;
		//Unreachable state: ich == EOF already implemented before switch-case.
		case END:
			break;
		default:
			break;
	}

    if (ch == '\n')
      line_cur++;
    if (got_eof)
      break;

	ch_before = ch;
  }
  
  return(EXIT_SUCCESS);
}
