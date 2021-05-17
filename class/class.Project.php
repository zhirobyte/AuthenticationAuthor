<?php
include 'class.Department.php';

class Project extends Connection
{
    private $pnumber = '';
    private $pname = '';
    private $plocation = '';
    private $dept;
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
        $this->dept = new Department();
    }

    //memilih semua project
    public function SelectAllProject()
    {
        $sql = "SELECT p.*, d.dname FROM project p INNER JOIN department d ON p.dnum = d.dnumber ORDER BY p.pnumber";
        $result = mysqli_query($this->connection, $sql);

        $arrResult = array();
        $cnt = 0;
        if (mysqli_num_rows($result) > 0) {
            while ($data = mysqli_fetch_array($result)) {

                $objProject = new Project();
                $objProject->pnumber = $data['pnumber'];
                $objProject->pname = $data['pname'];
                $objProject->plocation = $data['plocation'];
                $objProject->dept->dnumber = $data['dnum'];
                $objProject->dept->dname = $data['dname'];
                $arrResult[$cnt] = $objProject;
                $cnt++;
            }
        }
        return $arrResult;
    }

    //memilih satu project 
    public function SelectOneProject()
    {
        $sql = "SELECT * FROM project WHERE pnumber=$this->pnumber";
        $resultOne = mysqli_query($this->connection, $sql) or die(mysqli_error($this->connection));
        if (mysqli_num_rows($resultOne) == 1) {
            $this->hasil = true;
            $data = mysqli_fetch_assoc($resultOne);
            $this->pnumber = $data['pnumber'];
            $this->pname = $data['pname'];
            $this->plocation = $data['plocation'];
            $this->dept->dnumber = $data['dnum'];
        }
    }

    //menambahkan project
    public function AddProject()
    {
        $sql = "INSERT INTO project (pnumber, pname, plocation, dnum)
        VALUES ($this->pnumber, '$this->pname', '$this->plocation', " . $this->dept->dnumber . ")";
        $this->hasil = mysqli_query($this->connection, $sql);
        if ($this->hasil)
            $this->message = 'Data berhasil di ubah!';
        else
            $this->message = 'Data gagal di ubah!';
    }

    //mengupdate project
    public function UpdateProject()
    {
        $sql = "UPDATE project
        SET pname ='$this->pname',
        plocation = '$this->plocation',
        dnum=" . $this->dept->dnumber . "
        WHERE pnumber = $this->pnumber";
        $this->hasil = mysqli_query($this->connection, $sql);
        if ($this->hasil)
            $this->message = 'Data berhasil diubah!';
        else
            $this->message = 'Data gagal diubah!';
    }
}
