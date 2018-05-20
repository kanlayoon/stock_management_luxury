import { Component, OnInit, ViewChild ,Inject} from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { MatFormFieldModule, MatError, MatFormField, MatPlaceholder, MatFormFieldControl } from '@angular/material/form-field';
import { MatPaginator, MatSort, MatTableDataSource } from '@angular/material';
import { Product } from '../product/product.model';
import { Http, Headers, RequestOptions, Response } from '@angular/http';
import { Observable, Subject } from 'rxjs/Rx';
import { DataSource } from '@angular/cdk/collections';
import { Router, ActivatedRoute } from '@angular/router';
import { RequestService } from '../request/request.service';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material';

export class State {
  constructor(public name: string, public population: string, public flag: string,
  private route: ActivatedRoute,
    private router: Router,
    private supplyService: RequestService, private _http: Http) { }
}
 
@Component({
  selector: 'app-request',
  templateUrl: './request.component.html',
  styleUrls: ['./request.component.css']
})
export class RequestComponent implements OnInit {
  dataSource1: MatTableDataSource<any>;
  code : any;
  date:Date;
  amount :any;
  Branch : any;
  public products: any[];
  constructor(
   public dialog: MatDialog,
    private route: ActivatedRoute,
    private router: Router,
    private RequestService: RequestService, private _http: Http) {

  }
  ngOnInit() {
    this.Branch = localStorage.getItem('currentUserStatus');
   
    if(this.Branch==1){
      this.router.navigate(['/' + 'login']);
    }
    this.RequestService.getAll().subscribe(data => {
      this.products = data;
      console.log(data);
      this.dataSource1 = new MatTableDataSource(this.products);
    },
      error => console.log(error));
  }

  myControl: FormControl = new FormControl();


  displayedColumns = ['Product_Id', 'Product_Name', 'ProductType_Name', 'Product_Des', 'Product_Instruction', 'input_num', 'button'];

  dataSource = new ProductDataSource(this.RequestService);

  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;

  applyFilter(filterValue: string) {
    filterValue = filterValue.trim(); // Remove whitespace
    filterValue = filterValue.toLowerCase(); // Datasource defaults to lowercase matches
    this.dataSource1.filter = filterValue;
  }
 

// request(pCode,amount): void{
//   this.code = pCode;
//   console.log("amount" + amount);
//   this.amount = amount;
//   let obj = {
//     code : this.code,
//     amount: this.amount,
//     bid: this.Branch,
//     Date: this.date = new Date(),
  
//   }
// console.log("obj" + obj)
//  this.RequestService.request(obj).subscribe(data => {
//       this.request = data;  
//     }, error => console.log(error));
//     document.getElementById("openModalButton").click( );
// }

openDialog(pCode,amount,name): void {
  let dialogRef = this.dialog.open(DialogOverviewReqDialog, {
    width: '300px',
    data: { pCode: pCode, amount: amount ,name:name}
  
    
  });

  dialogRef.afterClosed().subscribe(result => {
    console.log('The dialog was closed');
    //this.animal = result;
  });
}

}
export class ProductDataSource extends DataSource<any> {
  constructor(private supplyService: RequestService) {
    super();
  }
  connect(): Observable<Product[]> {
    return this.supplyService.getAll();
  }
  disconnect() { }
}


@Component({
  selector: 'dialog-overview-example-dialog',
  templateUrl: 'reqModal.html',
})
export class DialogOverviewReqDialog {
Branch :any;
date :Date;
request :any;
  constructor( private route: ActivatedRoute,
    private router: Router,
    private RequestService: RequestService, private _http: Http,
    public dialogRef: MatDialogRef<DialogOverviewReqDialog>,
    @Inject(MAT_DIALOG_DATA) public data: any) { }

  onNoClick(pCode,amount,data): void {
    //this.code = pCode;
    console.log("amount" + amount);
    //this.amount = amount;
    this.Branch = localStorage.getItem('currentUserStatus');
   
    if(this.Branch==1){
      this.router.navigate(['/' + 'login']);
    }
    let obj = {
      code : pCode,
      amount: amount,
      bid: this.Branch,
      Date: this.date = new Date(),
      status : 0
    }
  console.log("obj" + obj)
   this.RequestService.request(obj).subscribe(data => {
        this.request = data;  
      }, error => console.log(error));
    document.getElementById("openModalButton").click( );
    this.dialogRef.close();
  }

 
}
