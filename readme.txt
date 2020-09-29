The 2D crystal growth simulation simulates the impact of temperature, impurity, defect and gravity.

To run the codes, please follow the steps describe below:

1. Preparation:
Ensure java environment is well installed, if not, please down the java environment. To test whether your java environment is ok, open command line and type java, if java is properly installed, a list of the parameters of java will be shown in the command line.

2. Execution steps:

1) Type upxml.bat    this is to create corresponding workspace in the server side.

2) Type updatazip.bat this is to update the source file to the server.

3) Type run.bat  this is to run the simulation.

4) Go to http://134.117.53.66:8080/cdpp/sim/workspaces/test/lopez/crystal2      to download the simulation results

5) Type delworkspace.bat to delete the workspace

3. How to see the results:

1) Open CD++ modeler and import the palette file: crystal.pal.

2) Unzip the simulation results and find the SimDrawLog.log.

3) Add the SimDrawLog.log into the CD++ modeler and load it.

5) Run the CD++ modeler to see the results

4. Other instruction

Not all the test value files (crystal.val) are provided. The default test value file is composed of few impurities and defects. If you want to test other files, please follow the steps described below:

1) Delete the crystal.val file in the zip file. It is recommend to backup the file before delete it.

2) Rename any file you like with the name of crystal1.val, crystal2.val, crystal3.val to crystal.val.

3) Add the file crystal.val into the zip file and follow the execution step described in step 2.

4)crystal1.val is composed with heavy impurities and defects, crystal2.val contains less impurities and defects than crystal1.val. crystal3.val own the least impurities and defects.
