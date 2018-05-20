import { Component, OnInit } from '@angular/core';
import { ViewChild } from '@angular/core';
import { MatPaginator, MatSort, MatTableDataSource } from '@angular/material';
import { UsingProductBService } from '../usingproduct-branch/usingproductB.service';
import { Http, Headers, RequestOptions, Response } from '@angular/http';
import { Observable, Subject } from 'rxjs/Rx';
import { DataSource } from '@angular/cdk/collections';
import { Router, ActivatedRoute } from '@angular/router';
// import { course } from './usingproduct-branch.model';
import { Product } from '../product/product.model';
import { CourseProduct } from './courseproduct.model';
@Component({
  selector: 'app-usingproduct-branch',
  templateUrl: './usingproduct-branch.component.html',
  styleUrls: ['./usingproduct-branch.component.css']
})
export class UsingproductBranchComponent implements OnInit {
  countUndefined: any;
  temp = [];
  dataSource1: MatTableDataSource<any>;
  Code: any;
  Amount: any;
  Date: any;
  use: any[];
  CourseSel: any;
  public course: any;
  public courseSelected: any;
  public product: any[];
  public CourseProduct: any[];
  showTable: any;
  public id_c: any;
  dataSource: any;
  useKey: any;
  courseproduct: any;
  key: any;
  Branch: any;
  date: Date;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private UsingProductBService: UsingProductBService, private _http: Http) { }


  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;

  ngOnInit() {
    this.Branch = localStorage.getItem('currentUserStatus');


    if (this.Branch == 1) {
      this.router.navigate(['/' + 'login']);
    }
    //table product
    this.UsingProductBService.getAll(this.Branch).subscribe(data => {
      this.product = data;
      //this.dataSource = new ProductDataSource(this.UsingProductBService,this.id_c);
      this.dataSource1 = new MatTableDataSource(this.product);
    },
      error => console.log(error));

    //get key
    this.UsingProductBService.getKey().subscribe(data => {
      this.useKey = data;
      this.key = this.useKey[0].useKey
    }, error => console.log(error), () => console.log("get key complete"));

    this.UsingProductBService.get_course().subscribe(data => {
      this.course = data;
      console.log(data);

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
  displayedColumns = ['Product_Code', 'Product_Name', 'Product_Type', 'BranchProduct_EXP', 'Product_Des', 'Product_Instruction', 'BranchProduct_Amount', 'amount'];
  showProduct(id) {


    // console.log("ggggggggggggggggggggggggg");
    this.id_c = this.courseSelected.Course_Id;
    // console.log("courseSelected"+this.courseSelected.Course_Id);
    // console.log("id"+this.courseSelected.Course_Id);
    this.UsingProductBService.getCourseProduct(id).subscribe(data => {
      this.CourseProduct = data;
      // console.log(data);
      // console.log("id_c :"+this.id_c);
      this.showTable = 1;

      this.dataSource = new ProductDataSource(this.UsingProductBService, this.id_c);
      this.dataSource1 = new MatTableDataSource(this.CourseProduct);
    },
      error => console.log(error));
  }
  useProduct() {
    this.temp = [];
    
    let test: any;
    let i = 0;
    var inputAmount;
    var GetCode;
    var GetName;
    var GetBP_id;
    var getAmount;
    var warning1;
    this.countUndefined = 0;
    this.date;
    console.log("length: " + this.dataSource1.data.length);
    console.log("temp: " + this.temp.length);
    if (this.date == undefined) {
      document.getElementById("openModalButtonDate").click();
    }
    else {
      if (this.courseSelected == undefined) {
        document.getElementById("openModalButton2").click();
      }
      else {
        for (i = 0; i < this.dataSource1.data.length; i++) {
          inputAmount = (<HTMLInputElement>document.getElementById('inputAmount' + i)).value;
          //console.log("check")
         // console.log(inputAmount);
          if (inputAmount == undefined || inputAmount == '' || inputAmount == "0") {
            this.countUndefined++;
          }
        }
        //console.log(this.countUndefined);
       // console.log("countUndefined");
        if (this.countUndefined == this.dataSource1.data.length) {
          document.getElementById("openModalButtonInput").click();
        }
        else {

          for (i = 0; i < this.dataSource1.data.length; i++) {
            inputAmount = (<HTMLInputElement>document.getElementById('inputAmount' + i)).value;
            (<HTMLInputElement>document.getElementById('inputAmount' + i)).value ;
            GetCode = this.dataSource1.data[i].Product_Code;
            GetName = this.dataSource1.data[i].Product_Name;
            GetBP_id = this.dataSource1.data[i].BranchProduct_Id;
            getAmount = this.dataSource1.data[i].BranchProduct_Amount;
           console.log("inputamount: " + inputAmount);
            console.log("getAmount: " + getAmount); 
            // console.log(inputAmount + ' //i: ' + this.dataSource1.data.length);
            // console.log( this.dataSource1.data[i].Product_Code);


            //if (this.date != undefined ) {

            //if (this.courseSelected.Course_Id != undefined) {

            let obj = {
              key: this.key + 1,
              code: GetCode,
              amount: inputAmount,
              course: this.courseSelected.Course_Id,
              date: this.date,
              bid: this.Branch
            }     // console.log("key" + this.key);
            // console.log("code" + GetCode );
            // console.log("amount" + inputAmount);
            // console.log("course" + this.courseSelected.Course_Id);
            // console.log("date" + this.date);
            // if(inputAmount == ''){
            //   inputAmount = undefined;
            // }

            

              //del product in stock
              if (inputAmount < getAmount && inputAmount != '') {
                this.temp.push(1);
                // this.UsingProductBService.useProduct(obj).subscribe(data => {
                //   this.use = data;
                // }, error => console.log(error), () => console.log("insert complete"));
                // let obj1 = {
                //   inputAmount: inputAmount,
                //   BP_id: GetBP_id
                // }
                // this.UsingProductBService.useProduct_update(obj1).subscribe(data => {
                //   this.use = data;
                // }, error => console.log(error), () => console.log("insert complete"));
                //document.getElementById("openModalButton1").click();
              }
              else if (inputAmount == getAmount  && inputAmount != '') {
                this.temp.push(2);
                // this.UsingProductBService.useProduct(obj).subscribe(data => {
                //   this.use = data;
                // }, error => console.log(error), () => console.log("insert complete"));
                // let obj1 = {
                //   BP_id: GetBP_id
                // }
                // this.UsingProductBService.useProduct_del(obj1).subscribe(data => {
                //   this.use = data;
                // }, error => console.log(error), () => console.log("insert complete"));
                //document.getElementById("openModalButton1").click();
              }

              else if (inputAmount > getAmount && inputAmount != '') {
                this.temp.push(3);
               // document.getElementById("openModalButton3").click();
              }else {
                this.temp.push(4);
              }
            

            // console.log("key" + this.useKey[0].useKey);

          }
          var count3 = 0;
          for (i = 0; i < this.dataSource1.data.length; i++) {
            var result = this.temp[i]
            console.log(i+ "/result: " + result);
            console.log("data: " +this.dataSource1.data[i].BranchProduct_Id);
            if (result == 3) {
               count3 = count3++;
            }
          }
          if(count3 != 0){
            document.getElementById("openModalButton3").click();
          }
          else{
            
            this.useReal();
          }
        }
      }
    }
  }
  useReal() {
    
    let test: any;
    let i = 0;
    var inputAmount;
    var GetCode;
    var GetName;
    var GetBP_id;
    var getAmount;
    var warning1;
    this.countUndefined = 0;
    this.date;
    for (i = 0; i < this.dataSource1.data.length; i++) {
      inputAmount = (<HTMLInputElement>document.getElementById('inputAmount' + i)).value;
      GetCode = this.dataSource1.data[i].Product_Code;
      GetName = this.dataSource1.data[i].Product_Name;
      GetBP_id = this.dataSource1.data[i].BranchProduct_Id;
      getAmount = this.dataSource1.data[i].BranchProduct_Amount;
      //console.log("inputamount" + inputAmount);

      // console.log(inputAmount + ' //i: ' + this.dataSource1.data.length);
      // console.log( this.dataSource1.data[i].Product_Code);


      //if (this.date != undefined ) {

      //if (this.courseSelected.Course_Id != undefined) {

      let obj = {
        key: this.key + 1,
        code: GetCode,
        amount: inputAmount,
        course: this.courseSelected.Course_Id,
        date: this.date,
        bid: this.Branch
      }     // console.log("key" + this.key);
      // console.log("code" + GetCode );
      // console.log("amount" + inputAmount);
      // console.log("course" + this.courseSelected.Course_Id);
      // console.log("date" + this.date);

        //del product in stock

        if (this.temp[i]== 1) {
         // this.temp[i] = 1
          this.UsingProductBService.useProduct(obj).subscribe(data => {
            this.use = data;
          }, error => console.log(error), () => console.log("insert complete"));
          let obj1 = {
            inputAmount: inputAmount,
            BP_id: GetBP_id
          }
          this.UsingProductBService.useProduct_update(obj1).subscribe(data => {
            this.use = data;
          }, error => console.log(error), () => console.log("insert complete"));
          //document.getElementById("openModalButton1").click();
        }
        else if (this.temp[i]== 2) {
         // this.temp[i] = 2
          this.UsingProductBService.useProduct(obj).subscribe(data => {
            this.use = data;
          }, error => console.log(error), () => console.log("insert complete"));
          let obj1 = {
            BP_id: GetBP_id
          }
          this.UsingProductBService.useProduct_del(obj1).subscribe(data => {
            this.use = data;
          }, error => console.log(error), () => console.log("insert complete"));
          //document.getElementById("openModalButton1").click();
        }

       
      


      // console.log("key" + this.useKey[0].useKey);

    }
     document.getElementById("openModalButton1").click();

  }
}

export class ProductDataSource extends DataSource<any> {
  courseSelected: any;
  public id_c: any;
  // public CourseProduct :any[];
  constructor(private UsingProductBService: UsingProductBService, private id) {
    super();
    // console.log("iddddddddddddd"+ id);
  }

  // showProduct(id){
  //   console.log("ggggggggggggggggggggggggg");
  //   this.id_c=id;
  //   // console.log(this.courseSelected.Course_Id);
  //   this.UsingProductBService.getCourseProduct(id).subscribe(data => {
  //     this.courseproduct = data;
  //     console.log(data);

  //   },
  //     error => console.log(error;));    
  // }
  connect(): Observable<CourseProduct[]> {
    // console.log(this.id);
    return this.UsingProductBService.getCourseProduct(this.id);
  }
  disconnect() { }
}


