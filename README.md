# TranUSE
TranUSE is a Java application to interpret Land cover & land use (LCLU) changes using user-defined change processes.

What is tranUSE?
----------------
TranUSE is a Java application to interpret LCLU changes using user-defined change processes. The application is based on the change process concept. A change process is defined as the conversion of one land patch from a class of LCLU to another one. The tranUSE algorithm compares patch by patch LCLU classes among two dates and assigns the corresponding change process previously defined by user.


Contact: Juan Miguel Requena, juanmir@ual.es
-------


System Requirements
-------------------
JDK: 1.7 or later.
Operating System: Windows, Unix based systems (Linux, Solaris and Mac OS X) and others.


Terms and Conditions
--------------------
This software may be used for all educational, management and research activities.  This software may not be used for any commercial or for-profit purposes.
The software is provided "as-is", and does not come with any warranty or guarantee of any kind. The register number of the intellectual property is RTA-141-15
(Andalusian Government https://ws096.juntadeandalucia.es/ninfa/entrada.do).


Download tranUSE
----------------
The software is free downloadable. The files constituting the application are:

- tranUSE.jar: Java executable archive.
- tranUSE.bat: executable script for Windows.
- README.txt: help file.
- “RtranUSE” folder: it contains a Java tranUSE version by parameters to run iteratively in command line. It has been thought to compute large study regions which generate input csv files
  with a big size impossible to manage by standard PCs. In addition, a R (http://www.R-project.org/) script is provided to run RtranUSE.
- Folder “examples”: it contains csv files with examples of required inputs for tranUSE.
- Folder “images”: it contains internal graphic archives required for the application and for creating direct accesses in different operating systems.


Getting started
---------------
Create a new folder called tranUSE and put together all downloaded files in it.
The software consists of a jar file, tranUSE.jar. 
If you are using Microsoft Windows, we recommend double-click on the tranUSE.bat file to run the application. Before, you can set the amount of memory that your PC gives to Java
(1.3 megabytes as maximum in Windows) by editing the file and replacing the number “530” with another. Otherwise, enter "java -mx530m -jar tranUSE.jar" in a command shell
(where "530" can be replaced by the amount of memory you want made available to the program).


General problems
----------------
- Problems with your Java installation.
Sign: clicking on tranUSE.bat causes a window to appear but immediately disappear.
Open the command line of ms-dos (by clicking "start" then "run" and then typing "cmd"). Go to the directory where the tranUSE.jar and tranUSE.bat are (using the “cd” command) and
type tranUSE.bat. You may get three different responses:

1- “Unable to access jarfile tranUSE.jar”
Cause: if you downloaded the tranUSE.jar file using Microsoft Internet Explorer, Explorer incorrectly renamed this file. 
Solution: you have to rename it as tranUSE.jar

2- “The java class could not be loaded”
Cause: the Java version that is installed on your PC is not updated.
Solution: to get a new version, go to https://www.oracle.com/downloads/index.html, and search the last version the Java runtime environment (JRE).

3- “Java is not recognized as an internal or external command, operable program or batch file”
Cause: either you don't have Java installed (then, you have to install a new version from https://www.oracle.com/downloads/index.html), or Java is not mentioned in your "path" variable.
Solution: you have to set the Path Variable in Windows. For that: 1- From the desktop, right click My Computer and click properties; 2- In the System Properties window, click on the
Advanced tab; 3- In the Advanced section, click the Environment Variables button; 4- In the Environment Variables window, highlight the Path variable in the Systems Variable section and
click edit.  Add the directory where the java executable is. For example, add ";C:\Program Files\Java\jdk1.7.0_67\bin" to the end of the path variable if you downloaded Java 1.7.0_67.

- Problems with the capacity of memory. If you get the following messages: "out-of-memory" or "heap space", please, make sure that you are clicking on tranUSE.bat and not on tranUSE.jar.


Required data input/output and how to run tranUSE
-------------------------------------------------
The inputs required by the software are csv files (i.e., comma-separated value). Below, the content and structure of the required data files are explained:

1- Land cover-land use data. This input data file consists of five columns with the following header: Index, Code1, Code2, Label1, Label2 and Change, and as many rows as there are patch
lands from the maps. The Index column contains the spatial identifier of each patch land from the original GIS map. Code1 and Code2 correspond to the codes (i.e., numbers) that represent
each land cover-land use class in the first date and the second one, respectively. Label1 and Label2 are the descriptions for those codes and finally, Change is an empty column which will
be filled by the application with the corresponding change processes. Below, it is showed an example of the structure of this file:

Index,Code1,Code2,Label1,Label2,Change
1,10,10,urban,urban,
2,10,20,urban,forest,
3,21,11,shrubland,village,
(...)

The absolute path for this file must be introduced in the first box of the tranUSE interface and then click on the “Load input data” bottom. A message like “Your csv file has been
successfully loaded” and a sample with the ten first rows of the file should appear at the command line.

2- Change process files. It is required one csv file per process and each one of them must be imported independently by introducing its absolute path and name in the “Process name” box
and then click on the “Create Process” bottom. Each csv file consists of two columns with the following header: Code1 and Code2. The column Code1 should contain the codes for the LCLU
classes in the first date and Code2 the codes in the second one. The length of both columns must match; therefore gaps must be filled in with the number -999. There is no limit for the
number of change processes that can be created. In the example below, a change process called “Urbanization” is defined as follows:

Code1,Code2
20,10
21,11
22,-999
23,-999
(…)

After creating the corresponding change process, a message like “The process Urbanization has been successfully created” and a sample with the ten first rows of the file should appear at
the command line. The step 2- must be repeated as many times as change processes the user wants to define.

3- Finally, once all change processes have been created, the name (including the extension csv) and absolute path to the folder where the user would like to save the output file and its
must be introduced in the “Output directory” box and then click on the “Run tranUSE” bottom. When the software has finalized a message like “Your file has been successfully exported” will
appear at the command line and the corresponding output file will be created in the folder indicated. The csv output file can be joined by the column containing the spatial identifier
(i.e., column Index) to a dbf table of the vector layer representing the LCLU map.


GNU General Public License, version 3 (GPL-3.0) (https://opensource.org/licenses/GPL-3.0)
-----------------------------------------------

    Copyright (C) <2015>  <CAESCG>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
