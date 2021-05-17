<?php
include 'class.Employee.php';

class Department extends Connection
{
    private $dnumber = '';
    private $dname = '';
    private $mgr_start_date = '';
    private $mgr;
    private $hasil = false;
    private $message = '';


    public function __get($atribute)
    {
        if (property_exists($this, $atribute)) {
            return $this->$atribute;
        }
    }

    public function __set($atribut, $value)
    {
        if (property_exists($this, $atribut)) {
            $this->$atribut = $value;
        }
    }

    function __construct()
    {
        parent::__construct();
        $this->mgr = new Employee();
    }


    public function SelectAllDepartment()
    {
        $sql = "SELECT d.*, e.ssn,
        concat(e.fname, ' ', e.minit, ' ', e.lname) as mgr_name FROM department d INNER JOIN employee e  ON d.mgr_ssn = e.ssn";
        $result = mysqli_query($this->connection, $sql);
        $arrResult = array();
        $cnt = 0;
        if (mysqli_num_rows($result) > 0) {
            while ($data = mysqli_fetch_array($result)) {
                $objDepartment = new Department();
                $objDepartment->dnumber = $data['dnumber'];
                $objDepartment->dname = $data['dname'];
                $objDepartment->mgr->ssn = $data['ssn'];
                $objDepartment->mgr->fname = $data['mgr_name'];
                $objDepartment->mgr_start_date =
                    $data['mgr_start_date'];
                $arrResult[$cnt] = $objDepartment;
                $cnt++;
            }
        }
        return $arrResult;
    }
}
