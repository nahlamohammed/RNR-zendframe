<?php

class Application_Model_Thread extends Zend_Db_Table_Abstract {

    protected $_name = "thread";

    function addThread($data) {
        $userInfo = Zend_Auth::getInstance()->getStorage()->read();
        $row = $this->createRow();
        $row->userId = $userInfo->id;
        $row->toCategoryId = $data['toCategoryId'];
        $row->title = $data['title'];
        $row->stick = $data['stick'];
        $row->picture = $data['picture'];
        $row->body = $data['body'];
        return $row->save();
    }

    function lockThread($data) {
        if ($data[0]['lock'] == 'off') {
            $data[0]['lock'] = 'on';
            return $this->update($data[0], "id=" . $data[0]['id']);
        } else {
            $data[0]['lock'] = 'off';
            return $this->update($data[0], "id=" . $data[0]['id']);
        }
    }

    function listThreads($toCategoryId) {
        return $this->fetchAll("toCategoryId=$toCategoryId")->toArray();
    }

    function deleteThread($id) {
        return $this->delete("id=$id");
    }

    function getThreadById($toCategoryId,$id) {
        //return $this->find($id)->toArray();
      return  $this->fetchAll(array("toCategoryId=$toCategoryId","id=$id"))->toArray();
    }

    function editThread($data) {
        if (empty($data['picture'])) {
            unset($data['picture']);
        }
        $this->update($data, "id=" . $data['id']);
        return $this->fetchAll()->toArray();
    }

}
