# IntelliJ Configuration Files 


:warning: ***These are all WIP! They may not match our style guide exactly, so if you see something that's missing
or incorrect, please update the file accordingly.*** :warning:

Here you can find .xml for use with IntelliJ, which you can import from `Preferences -> Editor -> Code Style -> Java`.

### Brandwatch.xml Configurations  
- Brandwatch style import ordering 
- Right margin set at 140 (superlinter cutoff)
- some SQL formatting
- Java method signature and parameter formatting:
  - Blocks inline alignment of multi-line parameters (uses continuation indent instead)
  - 4-space continuation indent for wrapped parameters (8-space also allowed, but will trigger checkstyle warning)
  - Closing parenthesis on new line when parameters are wrapped
  - Applies to both method declarations and method calls 
