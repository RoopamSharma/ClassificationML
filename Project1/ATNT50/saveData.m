function saveData(trainData,testData)  
	save('trainXY.txt','trainData');
	save('testXY.txt','testData');
	printf('Data successfully stored. Press any key to continue.......\n');
	pause;
end;