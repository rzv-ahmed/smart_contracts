// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract todo {

    uint public count=0;

    struct task{
        uint id;
        string content;
        bool completed;
    }

    mapping (uint => task) public tasks;

    constructor() {
        createTask ("This is the first task");
    }

    function createTask(string memory y) public{
        count++ ;
        tasks[count] = task(count , y , false);

    }

    function completed(uint id) public {
        task memory _task =tasks[id];
        _task.completed=!_task.completed;
        tasks[id]=_task;

    }
    
}