<?php

class Application_Model_user extends Zend_Db_Table_Abstract
{

    protected $_name = "user";
    
    function addUser($data){
        $row = $this->createRow();
        $row->userName = $data['userName'];
        $row->password = md5($data['password']);
        $row->email = $data['email'] ;
        $row->gender = $data['gender'] ;
        $row->country = $data['country'] ;
        $row->profilePicture = $data['profilePicture'] ;
           $row->signature = $data['signature'] ;
        return $row->save();
    }
    function getUserById($id){
        return $this->find($id)->toArray();
    }

}

