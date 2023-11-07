// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract student_management {
    struct student{
        string name;
        string enrollment;
        uint age;
        uint [] grade;
    }

    mapping (uint => student) public students;

    uint [] public ids;

    constructor(string memory _name,string memory _enrollment, uint _age, uint[] memory _grades) {
        students[1]= student(_name,_enrollment,_age,_grades);
        ids.push(1);
    }

    function addStudent(string memory _name,string memory _enrollment, uint _age, uint[] memory _grades) public {
        uint newID = ids.length+1;
        students[newID] = student(_name,_enrollment,_age,_grades);
        ids.push(newID);
    }

    function updateStudentInfo(uint id,string memory _enrollment)public{
            uint validity =0;
            for (uint i=0; i< ids.length; i++) 
            {
                if (ids[i]==id) {
                    validity=1;
                }
            }
            require(validity !=0,"students doesnot exiest");
            students[id].enrollment=_enrollment;
    }

    function getStudent(uint _id)public view returns(string memory,uint,string memory,uint[] memory) {
        uint validity =0;
            for (uint i=0; i< ids.length; i++) 
            {
                if (ids[i]==_id) {
                    validity=1;
                }
            }
            require(validity !=0,"students doesnot exiest");
            student memory stu =students[_id];
            return(stu.name,stu.age,stu.enrollment,stu.grade);
    }

    function updateChange(uint id,uint _age) public{
        uint validity=0;
        for (uint i=0; i<ids.length ; i++) 
        {
            if (ids[i]==id) {
                validity =1;

            }
        }
        require(validity !=0,"students doesnot exiest");
        students[id].age=_age;

    }

    

}