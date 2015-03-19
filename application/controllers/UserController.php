<?php

class UserController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
    }

    
      public function indexAction()
    {
       $this->view->msg = "index";
    }
    
    public function homeAction() {
        
    }

    public function addAction() {
        $form = new Application_Form_User();

        if ($this->_request->isPost()) {
            if ($form->isValid($this->_request->getParams())) {
                $user_info = $form->getValues();
                $user_model = new Application_Model_User();
                $user_model->addUser($user_info);
            }
            $this->redirect("user/login");
        }

        $this->view->form = $form;
    }

    public function loginAction() {
        $user_form = new Application_Form_User();
        $user_form->removeElement("userName");
        $user_form->removeElement("gender");
        $user_form->removeElement("country");
        $user_form->removeElement("profilePicture");
        $user_form->removeElement("signature");
        $user_form->getElement("email")->removeValidator("Zend_Validate_Db_NoRecordExists");
        $this->view->form = $user_form;
        if ($this->_request->isPost()) {
            if ($user_form->isValid($this->getRequest()->getParams())) {
                $email = $user_form->getValue("email");
                $password = $user_form->getValue("password");
                $db = Zend_Db_Table::getDefaultAdapter();
                $auth = new Zend_Auth_Adapter_DbTable($db, 'user', 'email', 'password');
                $auth->setIdentity($email);
                $auth->setCredential(md5($password));
                $row = $auth->authenticate();
                if ($row->isValid()) {
                    $autho = Zend_Auth::getInstance();
                    $storage = $autho->getStorage();
                    //info=$autho ->getidentity
                    $storage->write($auth->getResultRowObject(array("id", "userName", "type","profilePicture","signature","ban")));
                    //info-arrow id
                    $this->view->message = "valid user";
                    $info = $autho->getIdentity();
                    $this->redirect("user/home");
                } else {
                    $this->view->message = "not valid user";
                }
            }
        }
    }
    
        public function logoutAction(){
        $autho=Zend_Auth::getInstance();
        $autho->clearIdentity();
        $this->redirect("user/home");
    }

}
