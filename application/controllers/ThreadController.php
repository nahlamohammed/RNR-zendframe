<?php

class ThreadController extends Zend_Controller_Action
{

    public function init()
    {
 
    }

    public function indexAction()
    {

    }
    
    public function addAction()
    {
       $toCategoryId = $this->_request->getParam("toCategoryId");   
       $form  = new Application_Form_Thread();
       
       if($this->_request->isPost()){
           if($form->isValid($this->_request->getParams())){
               $thread_info = $form->getValues();
               $thread_info['toCategoryId']=$toCategoryId;
               $thread_model = new Application_Model_Thread();
               $thread_model->addThread($thread_info);                                     
           }
       }   
	$this->view->form = $form;
    }
    
    public function listAction()
    {
        $toCategoryId = $this->_request->getParam("toCategoryId");   
        $thread_model = new Application_Model_Thread();
        $this->view->threads = $thread_model->listThreads($toCategoryId);
        $this->view->toCategoryId =  $toCategoryId;
    }
    
    public function displayAction(){
        
        $id = $this->_request->getParam("id");
        $thread_model = new Application_Model_Thread();
        $thread= $thread_model->getThreadById($id);
        
        //$comment_model= new Application_Model_Comment();
        //$comments= $comment_model->listcomments($id);
   
        $this->view->thread = $thread[0];
  //      $this->view->comments = $comments;
        
    }

        public function deleteAction()
    {
        $id = $this->_request->getParam("id");
        $toCategoryId = $this->_request->getParam("toCategoryId");
        if(!empty($id)){
            $thread_model = new Application_Model_Thread();
            $thread_model->deleteThread($id);
        }
            $this->redirect("thread/list/toCategoryId/".$toCategoryId);   
    }

}

