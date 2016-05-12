var taskLib = (function() {

var waitingRoom = [];

function moveToWaitingRoom(task) {
	waitingRoom.push(task);
}

function cleanWaitingRoom() {
	for (var i = 0; i <= waitingRoom.length - 1; i++) {
		if (waitingRoom[i].dependencies.length == 0) {
    			waitingRoom[i].job();
    			waitingRoom.splice(i,1)
    	}
    }
}

return {
	runTasks: function(tasks) {
		for (var task in tasks) {
			var task = tasks[task];
			if (task.dependencies.length == 0) {
				task.job();
			} else {
				moveToWaitingRoom(task);
			}
		}
	},
	completed: function(task) {
		console.log(task + ' has completed!');
	    return function() {
	    	for (var i = 0; i <= waitingRoom.length - 1; i++) {
	    		index = waitingRoom[i].dependencies.indexOf(task)
	    		if (index != -1) {
	    			waitingRoom[i].dependencies.splice(index,1);
	    		}	
	    	}
	    	cleanWaitingRoom()
	    }
	}
}
})()

taskLib.runTasks({
	a: {
		task: 'a',
		job: function() { setTimeout(taskLib.completed('a'), 1000) },
		dependencies: []
	},
	b: {
		task: 'b',
		job: function() { setTimeout(taskLib.completed('b'), 2000) },
		dependencies: ['a','c']
	},
	c: {
		task: 'c',
		job: function() { setTimeout(taskLib.completed('c'), 1000) },
		dependencies: ['a']
	},
});