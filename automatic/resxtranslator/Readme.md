# [<img src="https://cdn.rawgit.com/AdmiringWorm/chocolatey-packages/678798af55b2b9e15a70e8bb3db60c9f98328679/icons/resxtranslator.png" height="48" width="48" /> resxtranslator](https://chocolatey.org/packages/resxtranslator)

Tool for non-developers to quickly translate resource files (resx) in .NET projects to multiple languages in parallel. Shows a tree view of all resources and all translation strings in parallel, one column per language. Compatible with VS2008-VS2015.

### Usage guidelines
Launch the Resx Resource Translator, go to the File/Open menu option and browse to the root of your Visual Studio project (basically where your SLN file is located). The tool will now iterate thru all sub folders and look for resx files. (Note that it's not using the SLN or project files, it's just looking for files with file extension resx).

The left panel will now show a tree view of all found resources. You open a resource by double clicking the tree node. You will then see all resource strings in that file in the right part of the screen.

The top part will show the translated languages identified for this resx file. The Resx Resource Translator bases the presentation on a generic resx file without any translation as the default (called No Language Value in this application). This can be machine-translated or semi-translated. Then it identifies all other languages for that file and displays a list on top with a column for each language. You can hide a language from the grid with the check boxes. You can navigate between the different resources without saving and without losing your work. Everything is kept in memory until you select File/Save.

### Columns
- Key - this is the internal key that is used in your application. It can't be modified in the ResxTranslator.
- No Language Value - the string value from the main resx file (without a language identifier)
- Comments - comments that is never visible in the application, but can help translators understand what is meant. I use it to list what parameters I use in *string.Format*.

The rows that are red means one or more languages are missing values. I have a special case in here where {"[]"} around a value means it's not translated. For example if I haven't done the translation for the *ErrorHeader* value then I just enter {"[ErrorHeader]"} under that language. That way I will still see something when I develop using that value, but the ResxTranslator will show it red since it's not translated because of the brackets.

## Package Parameters
- `/NoStartMenuIcon`   - Don't create a shortcut icon on the start menu
- `/CreateDesktopIcon` - Create a shortcut icon on the desktop

These parameters can be passed to the installer with the use of --params.
For example: `--params '"/NoStartMenuIcon /CreateDesktopIcon"'`
