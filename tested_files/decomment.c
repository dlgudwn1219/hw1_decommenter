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
// state: Current state of code
enum DFAState {Code, Poss_comm, Single_comm, Multi_comm, In_string, In_char, END};
enum DFAState state = Code;

//functions for each states
void func_Code(char ch);
void func_Poss_comm(char ch, int line_cur, int *line_com);
void func_Single_comm(char ch);
void func_Multi_comm(char ch, char ch_before);
void func_In_string(char ch);
void func_In_char(char ch);
int func_END(int line_cur);

/* 
Input: 
Output: Replace Input Comments with ' ' (i.e. Decommenting), # of lines preserved
Error: If Input.c file has unterminated comment
*/
int main(void)
{
  // ich: int type variable to store character input from getchar() (abbreviation of int character)
  int ich;
  // line_cur & line_com: current line number and comment line number (abbreviation of current line and comment line)
  int line_cur, line_com;

  line_cur = 1;
  line_com = -1;

  // ch: character that comes from casting (char) on ich (abbreviation of character)
  // ch_before: character just before ch
  char ch, ch_before;

  // This while loop reads all characters from standard input one by one
  while (1) {
	int got_eof = 0;

    ich = getchar();

	// prints error if comment is unterminated
    if (ich == EOF)	return func_END(line_com);

    ch = (char)ich;
    
	switch (state){
		case Code:
			func_Code(ch);
			break;
		case Poss_comm:
			func_Poss_comm(ch, line_cur, &line_com);
			break;
		case Single_comm:
			func_Single_comm(ch);
			break;
		case Multi_comm:
			func_Multi_comm(ch, ch_before);
			break;
		case In_string:
			func_In_string(ch);
			break;
		case In_char:
			func_In_char(ch);
			break;
		//END is already implemented above (if (ich == EOF))
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

// state = Code: print ch, change state
void func_Code(char ch)
{
  	if (ch != '/') fprintf(stdout,"%c", ch);

	if (ch == '/') state = Poss_comm;
	if (ch == '\"') state = In_string;
	if (ch == '\'') state = In_char;
}

// state = Poss_comm: change state to (Single_comm or Multi_comm or Code)
// update line_com if state becomes comment
void func_Poss_comm(char ch, int line_cur, int *line_com)
{
	if (ch == '/'){
		*line_com = line_cur;
		fprintf(stdout, "%c", ' ');
		state = Single_comm;
	}
	else if (ch == '*'){
		*line_com = line_cur;
		fprintf(stdout, "%c", ' ');
		state = Multi_comm;
	}
	else {
		fprintf(stdout, "%c", '/');
		fprintf(stdout, "%c", ch);
		state = Code;
	}
}

// state = Single_comm: change state when out of comment
void func_Single_comm(char ch)
{			
	if (ch == '\n'){
		fprintf(stdout, "%c", '\n');
		state = Code;
	}
}

// state = Multi_comm: preserve line num, change state when out of comment
void func_Multi_comm(char ch, char ch_before)
{
	if (ch == '\n') fprintf(stdout, "%c", '\n');
	if (ch_before == '*' && ch == '/') state = Code;
}

// state = In_string: print char until out of string
void func_In_string(char ch)
{	
	fprintf(stdout, "%c", ch);
	if (ch == '\"') state = Code;
}

// state = In_char: print char until out of character
void func_In_char(char ch)
{			
	fprintf(stdout, "%c", ch);
	if (ch == '\'') state = Code;
}

// state = END: print error if unterminated comment, return
int func_END(int line_com)
{
	if (state == Single_comm || state == Multi_comm){
		fprintf(stderr, "Error: line %d: unterminated comment\n", line_com);
		return (EXIT_FAILURE);
	}
	else
		return (EXIT_SUCCESS);
}
