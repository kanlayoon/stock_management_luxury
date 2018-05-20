import { Component, OnInit ,Inject} from '@angular/core';
import { ViewChild} from '@angular/core';
import {MatPaginator, MatSort, MatTableDataSource} from '@angular/material';
import { Http, Headers, RequestOptions, Response } from '@angular/http';
import { Console } from '@angular/core/src/console';
import { Router, ActivatedRoute } from '@angular/router';
import { manageEmployeeService } from './manage-employee.service';
import { DataSource } from '@angular/cdk/collections';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material';
import {MatRadioModule} from '@angular/material/radio';

@Component({
  selector: 'app-manage-employee',
  templateUrl: './manage-employee.component.html',
  styleUrls: ['./manage-employee.component.css']
})
export class ManageEmployeeComponent implements OnInit {
  dataSource1: MatTableDataSource<any>;
  dataSource2: MatTableDataSource<any>;
  

  // @ViewChild(MatPaginator) paginator: MatPaginator;
  // @ViewChild(MatSort) sort: MatSort;
  manager :any;
  Hmanager:any;
  
  constructor( private route: ActivatedRoute,
    private router: Router,public dialog: MatDialog,
    private manageEmployeeService: manageEmployeeService, private _http: Http) {
 

    // Assign the data to the data source for the table to render
   //this.dataSource = new MatTableDataSource(users);
  }

  ngOnInit() {
    this.manageEmployeeService.getHeadManager().subscribe(data => {
      this.Hmanager = data;
      this.dataSource1 = new MatTableDataSource(this.Hmanager);
      console.log(data);
     
    },
      error => console.log(error));
    this.manageEmployeeService.getManager().subscribe(data => {
      this.manager = data;
      this.dataSource2 = new MatTableDataSource(this.manager);
      console.log(data);
      
    },
      error => console.log(error));

     

    // this.dataSource1.paginator = this.paginator;
    // this.dataSource1.sort = this.sort;
  }
  displayedColumns = ['branch', 'name', 'last', 'btt'];
  favoriteSeason: string;

  seasons = [
    'Winter',
    'Spring',
    'Summer',
    'Autumn',
  ];
  openDialog(manager): void {
    console.log("manager" + manager)
    let branch = manager.Branch_Name;;
    let firstName = manager.Manager_FirstName;
    let lastName = manager.Manager_LastName;
    let gender = manager.Manager_Gender ;
    let add = manager.Manager_Address;
    let email = manager.Manager_Email;
    let user = manager.Manager_Username;
    let mid = manager.Manager_Id
    if(gender == false){
        gender = 'ผู้หญิง'
    }else{
      gender = 'ผู้ชาย'
    }
    console.log("branch" + branch);
    let dialogRef = this.dialog.open(managerDialog, {
      width: '550px', height : '550px',
      data: { branch:branch,firstName:firstName, lastName:lastName,gender:gender,add:add,email:email,user:user ,mid:mid}
    });

    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed');
      //this.animal = result;
    });
  }

}



@Component({
  selector: 'dialog-overview-example-dialog',
  templateUrl: 'dialog_branch.html',
})
export class managerDialog {

  constructor( private manageEmployeeService: manageEmployeeService, private _http: Http,
    public dialogRef: MatDialogRef<managerDialog>,
    @Inject(MAT_DIALOG_DATA) public data: any) { }
    
  onNoClick(): void {
    this.dialogRef.close();
  }

 
editManger(data){
    console.log("data"+ data.firstName + data.lastName + data.pass + data.gender +data.add + data.email + data.user);
    console.log("aaaaaaa"+ data.mid );
    if (data.gender == "ผู้หญิง"){
      data.gender  = 0 ;
    }else{
      data.gender=1;
    }
    let obj = {
      first : data.firstName,
      last :  data.lastName,
      gender :data.gender,
      email :data.email,
      user :data.user,
      pass :data.pass,
      add :data.add,
      mid : data.mid

    }
    this.manageEmployeeService.editManger(obj).subscribe(
      error => console.log(error),
      () => console.log("update complete"));
    document.getElementById("succ").click();
    this.dialogRef.close();
  }
    
  
  favoriteSeason: string;
  seasons = [
    'ผู้หญิง',
    'ผู้ชาย',
    
  ];
}

