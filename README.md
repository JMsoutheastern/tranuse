# tranUSE
tranUSE is a open-source Java application to interpret land use changes using user-defined land use trajectories.

What is tranUSE?
----------------
tranUSE is a Java application to interpret land use changes using user-defined land use trajectories. The application is based on the concept of land use trajectory: the conversion of one land patch from a land use category to another one. The tranUSE algorithm compares patch by patch land use categories among two dates and assigns the corresponding land use trajectory previously defined by user.


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
- “RtranUSE” folder: it contains a Java tranUSE version by parameters to run iteratively in command line. It has been thought to compute large study regions which generate large input csv files that are infeasible to manage by standard PCs. In addition, a R (http://www.R-project.org/) script is provided to run RtranUSE.
- Folder “examples”: it contains csv files with examples of required inputs for tranUSE.
- Folder “images”: it contains internal graphic archives required for the application and for creating direct accesses in different operating systems.


Getting started
---------------
Create a new folder called tranUSE and save all the files inside.
The software consists of a jar file named tranUSE.jar. 
If you are using Microsoft Windows, we recommend double-click on the tranUSE.bat file to run the application. Before that, you can set the amount of memory that your PC gives to Java (1.3 megabytes as maximum in Windows) by editing the file and replacing the number “530” with another. Otherwise, enter "java -mx530m -jar tranUSE.jar" in a command shell (where "530" can be replaced by the amount of memory you want made available to the program).


General problems
----------------
- Problems with your Java installation.
Sign: clicking on tranUSE.bat causes a window to appear but immediately disappear.
Open the command line of ms-dos (by clicking "start" then "run" and then typing "cmd"). Go to the directory where the tranUSE.jar and tranUSE.bat are (using the “cd” command) and type tranUSE.bat. You may get three different responses:

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

1- Land use data. This input data file consists of five columns containing the following header: Index, Code1, Code2, Label1, Label2 and Change, and as many rows as polygons there are. The Index column contains the spatial identifier of each polygon in the original shapefile. Code1 and Code2 correspond to the codes (i.e., numbers) that represent each land use category in the first and second date, respectively. Label1 and Label2 are the description of the codes, and finally, Change is an empty column that will be filled by the application with the corresponding land use trajectories. Below, it is shown an example of the structure of this file:

Index,Code1,Code2,Label1,Label2,Change
1,10,10,urban,urban,
2,10,20,urban,forest,
3,21,11,shrubland,village,
(...)

The absolute path of the file must be typed in the upper right box of the tranUSE interface, and then click on the “Load input data” bottom. A message like “Your csv file has been successfully loaded” and a sample with the ten first rows of the file should appear on the command line.

2- Land use trajectory files. It is required one csv file per trajectory and they must be independently imported by introducing their absolute path and name in the “Process name” box and then click on the “Create Process” bottom. Each csv file consists of two columns with the following header: Code1 and Code2. The column Code1 should contain the codes for the land use categories in the first date and Code2 the codes in the second one. The length of both columns must match; therefore gaps must be filled in with the number -999. There is no limit for the number of land use trajectories that can be created. In the example below, a trajectory called “Urbanization” is defined as follows:

Code1,Code2
20,10
21,11
22,-999
23,-999
(…)

After creating the corresponding trajectory, a message like “The process Urbanization has been successfully created” and a sample with the ten first rows of the file should appear at the command line. The step 2- must be repeated as many times as trajectories the user wants to define.

3- Finally, once all the trajectories have been processed, the name (including the extension csv) and the absolute path of the folder to save the output file must be typed in the “Output directory” box, and then click on the “Run tranUSE” bottom. Once the software has finalized, a message like “Your file has been successfully exported” will appear on the command line, and the corresponding output file will be created in the indicated folder. The csv output file can be joined by the column containing the spatial identifier (i.e., column Index) to a dbf table of the vector layer representing the land use map on a GIS.


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
