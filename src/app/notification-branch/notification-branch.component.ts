import { Component, OnInit } from '@angular/core';
import { ViewChild} from '@angular/core';
import {MatPaginator, MatSort, MatTableDataSource} from '@angular/material';
import { ProductService } from '../product/product.service';
import { Product } from '../product/product.model';
import { Http, Headers, RequestOptions, Response } from '@angular/http';
import { Observable, Subject } from 'rxjs/Rx';
import { DataSource } from '@angular/cdk/collections';
import { Router, ActivatedRoute } from '@angular/router';
import { notificationBService } from '../notification-branch/notification-branch.service';

@Component({
  selector: 'app-notification-branch',
  templateUrl: './notification-branch.component.html',
  styleUrls: ['./notification-branch.component.css']
})
export class NotificationBranchComponent implements OnInit {
  dataSource1: MatTableDataSource<any>;
  Code:any;
  Bid:any;
  Amount1:any;
  Amount2:any;
  Amount3:any;
  Branch :any;
  constructor(private route: ActivatedRoute,
    private router: Router,
    private notificationBService: notificationBService, private _http: Http) { 
  }
  displayedColumns = ['id', 'name','amount', 'noti1', 'noti2','noti3','button'];
  displayedColumns2 = ['id', 'name','exp', 'notiExp1', 'notiExp2','notiExp3','button'];
  // dataSource: MatTableDataSource<UserData>;
  dataSource = new ProductDataSource(this.notificationBService);
 
  public products: any[];
  
  ngOnInit() {
    this.Branch = localStorage.getItem('currentUserStatus');
    console.log("branch" + this.Branch);
    if(this.Branch == 1 ){
      this.router.navigate(['/' + 'login']);
    }

    this.notificationBService.getAll(this.Branch).subscribe(data => {
      this.products = data;
      this.dataSource1 = new MatTableDataSource(this.products);
     
      // console.log(data);
    },
      error => console.log(error));
  }
  applyFilter(filterValue: string) {
    filterValue = filterValue.trim(); // Remove whitespace
    filterValue = filterValue.toLowerCase(); // MatTableDataSource defaults to lowercase matches
    filterValue = filterValue.toUpperCase();
    filterValue = filterValue.toString();
    this.dataSource1.filter = filterValue;
    console.log("filterrrrrrrrrrrrrrrr");
    console.log(filterValue);
  }
  
  setting_amount(code,noti1,noti2,noti3,na1,na2,na3,bp_id){
    
    if( noti1 == undefined && noti2 == undefined && noti3 == undefined ||  noti1 == '' && noti2 == '' && noti3 == ''  ){
      console.log("undafined");
      document.getElementById("openModalButtonUndefine").click();
    }
    else {
    // console.log("data1 " + this.products.Notifications_Amount1);
    // console.log("data2 " + this.products.Notifications_Amount2);
    // console.log("data3 " + this.products.Notifications_Amount3);
    console.log("product" + this.products[0].Notifications_Amount1);
    console.log("1 " + noti1);
    console.log("2 " + noti2);
    console.log("3 " + noti3);
    console.log("bp_id" + bp_id);
    this.Code=code;
    this.Amount1=noti1;
    this.Amount2=noti2;
    this.Amount3=noti3;

if(noti1 == undefined){
  if(na1 == null){
      noti1 = 0;
  }
  else{
    noti1 = na1;
  }
    
}
if(noti2 == undefined){
  if(na2 == null){
      noti2 = 0;
  }
  else{
    noti2 = na2;
  }
    
}
if(noti3 == undefined){
  if(na3 == null){
      noti3 = 0;
  }
  else{
    noti3 = na3;
  }
    
}

console.log("1 " + noti1);
console.log("2 " + noti2);
console.log("3 " + noti3);


if(noti1 != 0 && noti2 == 0 && noti3 == 0 ){
    let obj1 = {
      BP_id : bp_id,
      amount1 : noti1
    }
    this.notificationBService.noti_amount1(obj1) .subscribe( 
      error => console.log(error),
     () => console.log("update complete"));
     document.getElementById("openModalButtonSuccessAmount").click();
}
else if(noti1 == 0 && noti2 != 0 && noti3 == 0){

  let obj2 = {
    BP_id : bp_id,
    amount2 : noti2
  }
  this.notificationBService.noti_amount2(obj2) .subscribe( 
    error => console.log(error),
   () => console.log("update complete"));
   document.getElementById("openModalButtonSuccessAmount").click();
}
else if(noti1 == 0 && noti2 == 0 && noti3 != 0){
  document.getElementById("openModalButton2").click();
  let obj3 = {
    BP_id : bp_id,
    amount3 : noti3
  }
  this.notificationBService.noti_amount3(obj3) .subscribe( 
    error => console.log(error),
   () => console.log("update complete"));
   document.getElementById("openModalButtonSuccessAmount").click();
}
else if(noti1 != 0 && noti2 != 0 && noti3 == 0){
  if(noti1>noti2){
    let obj1 = {
      BP_id : bp_id,
      amount1 : noti1
    }
    this.notificationBService.noti_amount1(obj1) .subscribe( 
      error => console.log(error),
     () => console.log("update complete"));

    let obj2 = {
      BP_id : bp_id,
      amount2 : noti2
    }
    this.notificationBService.noti_amount2(obj2) .subscribe( 
      error => console.log(error),
     () => console.log("update complete"));

     document.getElementById("openModalButtonSuccessAmount").click();
  }
  else{
    document.getElementById("openModalButton2").click();
  }
}
else if(noti1 != 0 && noti2 == 0 && noti3 != 0){
  if(noti1 > noti3){
    let obj1 = {
      BP_id : bp_id,
      amount1 : noti1
    }
    this.notificationBService.noti_amount1(obj1) .subscribe( 
      error => console.log(error),
     () => console.log("update complete"));

     let obj3 = {
      BP_id : bp_id,
      amount3 : noti3
    }
    this.notificationBService.noti_amount3(obj3) .subscribe( 
      error => console.log(error),
     () => console.log("update complete"));
     document.getElementById("openModalButtonSuccessAmount").click();
  }
  else{
    document.getElementById("openModalButton2").click();
  }
 
}
else if(noti1 == 0 && noti2 != 0 && noti3 != 0){
  if(noti2 > noti3){
    let obj2 = {
      BP_id : bp_id,
      amount2 : noti2
    }
    this.notificationBService.noti_amount2(obj2) .subscribe( 
      error => console.log(error),
     () => console.log("update complete"));

     let obj3 = {
      BP_id : bp_id,
      amount3 : noti3
    }
    this.notificationBService.noti_amount3(obj3) .subscribe( 
      error => console.log(error),
     () => console.log("update complete"));
     document.getElementById("openModalButtonSuccessAmount").click();
  }
  else{
    document.getElementById("openModalButton2").click();
  }
 
}
else if(noti1 != 0 && noti2 != 0 && noti3 != 0){
  if(noti1 > noti2 &&noti2 > noti3){
    let obj1 = {
      BP_id : bp_id,
      amount1 : noti1
    }
    this.notificationBService.noti_amount1(obj1) .subscribe( 
      error => console.log(error),
     () => console.log("update complete"));

    let obj2 = {
      BP_id : bp_id,
      amount2 : noti2
    }
    this.notificationBService.noti_amount2(obj2) .subscribe( 
      error => console.log(error),
     () => console.log("update complete"));

     let obj3 = {
      BP_id : bp_id,
      amount3 : noti3
    }
    this.notificationBService.noti_amount3(obj3) .subscribe( 
      error => console.log(error),
     () => console.log("update complete"));
     document.getElementById("openModalButtonSuccessAmount").click();
  }
  else{
    document.getElementById("openModalButton2").click();
  }
}
else{
  document.getElementById("openModalButton2").click();
}


    }
  }

  setting_exp(code,exp1,exp2,exp3,ne1,ne2,ne3,bp_id){
    if(exp1 == undefined && exp2 == undefined && exp3 == undefined ||  exp1 == '' && exp2 == '' && exp3 == ''){
      document.getElementById("openModalButtonUndefine").click();
    }
    else{
    console.log("1 " + exp1);
    console.log("2 " + exp2);
    console.log("3 " + exp3);
    console.log("bp_id" + bp_id);
    this.Code=code;

    if(exp1 == undefined){
      if(ne1 == null){
          exp1 = 0;
      }
      else{
        exp1 = ne1;
      }
        
    }
    if(exp2 == undefined){
      if(ne2 == null){
          exp2 = 0;
      }
      else{
        exp2 = ne2;
      }
        
    }
    if(exp3 == undefined){
      if(ne3 == null){
          exp3 = 0;
      }
      else{
        exp3 = ne3;
      }
        
    }
    
    console.log("1 " + exp1);
    console.log("2 " + exp2);
    console.log("3 " + exp3);
    
  

if(exp1 != 0 && exp2 == 0 && exp3 == 0 ){
  let obj1 = {
    BP_id : bp_id,
    exp1 : exp1
  }
  this.notificationBService.noti_exp1(obj1) .subscribe( 
    error => console.log(error),
   () => console.log("update complete"));
   document.getElementById("openModalButtonSuccessAmount").click();
}
else if(exp1 == 0 && exp2 != 0 && exp3 == 0){

let obj2 = {
  BP_id : bp_id,
  exp2 : exp2
}
this.notificationBService.noti_exp2(obj2) .subscribe( 
  error => console.log(error),
 () => console.log("update complete"));
 document.getElementById("openModalButtonSuccessAmount").click();
}
else if(exp1 == 0 && exp2 == 0 && exp3 != 0){
document.getElementById("openModalButton2").click();
let obj3 = {
  BP_id : bp_id,
  exp3 : exp3
}
this.notificationBService.noti_exp3(obj3) .subscribe( 
  error => console.log(error),
 () => console.log("update complete"));
 document.getElementById("openModalButtonSuccessAmount").click();
}
else if(exp1 != 0 && exp2 != 0 && exp3 == 0){
if(exp1>exp2){
  let obj1 = {
    BP_id : bp_id,
    exp1 : exp1
  }
  this.notificationBService.noti_exp1(obj1) .subscribe( 
    error => console.log(error),
   () => console.log("update complete"));

  let obj2 = {
    BP_id : bp_id,
    exp2 : exp2
  }
  this.notificationBService.noti_exp2(obj2) .subscribe( 
    error => console.log(error),
   () => console.log("update complete"));

   document.getElementById("openModalButtonSuccessAmount").click();
}
else{
  document.getElementById("openModalButton2").click();
}
}
else if(exp1 != 0 && exp2 == 0 && exp3 != 0){
if(exp1 > exp3){
  let obj1 = {
    BP_id : bp_id,
    exp1 : exp1
  }
  this.notificationBService.noti_exp1(obj1) .subscribe( 
    error => console.log(error),
   () => console.log("update complete"));

   let obj3 = {
    BP_id : bp_id,
    exp3 : exp3
  }
  this.notificationBService.noti_exp3(obj3) .subscribe( 
    error => console.log(error),
   () => console.log("update complete"));
   document.getElementById("openModalButtonSuccessAmount").click();
}
else{
  document.getElementById("openModalButton2").click();
}

}
else if(exp1 == 0 && exp2 != 0 && exp3 != 0){
if(exp2 > exp3){
  let obj2 = {
    BP_id : bp_id,
    exp2 : exp2
  }
  this.notificationBService.noti_exp2(obj2) .subscribe( 
    error => console.log(error),
   () => console.log("update complete"));

   let obj3 = {
    BP_id : bp_id,
    exp3 : exp3
  }
  this.notificationBService.noti_exp3(obj3) .subscribe( 
    error => console.log(error),
   () => console.log("update complete"));
   document.getElementById("openModalButtonSuccessAmount").click();
}
else{
  document.getElementById("openModalButton2").click();
}

}
else if(exp1 != 0 && exp2 != 0 && exp3 != 0){
if(exp1 > exp2 &&exp2 > exp3){
  let obj1 = {
    BP_id : bp_id,
    exp1 : exp1
  }
  this.notificationBService.noti_exp1(obj1) .subscribe( 
    error => console.log(error),
   () => console.log("update complete"));

  let obj2 = {
    BP_id : bp_id,
    exp2 : exp2
  }
  this.notificationBService.noti_exp2(obj2) .subscribe( 
    error => console.log(error),
   () => console.log("update complete"));

   let obj3 = {
    BP_id : bp_id,
    exp3 : exp3
  }
  this.notificationBService.noti_exp3(obj3) .subscribe( 
    error => console.log(error),
   () => console.log("update complete"));
   document.getElementById("openModalButtonSuccessAmount").click();
}
else{
  document.getElementById("openModalButton2").click();
}
}
else{
document.getElementById("openModalButton2").click();
}

}
}
}

  export class ProductDataSource extends DataSource<any> {
    Branch : any;
    constructor(private notificationBService: notificationBService) {
      super();
    }
   
    connect(): Observable<Product[]> {
      this.Branch = localStorage.getItem('currentUserStatus');
      return this.notificationBService.getAll(this.Branch);
    }
    disconnect() { }
  }
  


