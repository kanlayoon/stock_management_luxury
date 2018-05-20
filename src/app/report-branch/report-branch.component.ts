import { Component, OnInit } from '@angular/core';
import { ViewChild} from '@angular/core';
import {MatPaginator, MatSort, MatTableDataSource} from '@angular/material';
import { ReportBranchService } from './report-branch.service';
import { DataSource } from '@angular/cdk/collections';
//import { CsvService } from "angular2-json2csv";
import * as json2csv from 'json2csv';
declare var require: any
declare let jsPDF;
import { Router, ActivatedRoute, Params } from '@angular/router';
//import { PERSONS, Person } from './model';
import { Observable } from 'rxjs';
import 'rxjs/add/operator/toPromise';
import { Http, Headers, RequestOptions, Response } from '@angular/http';

@Component({
  selector: 'app-report-branch',
  templateUrl: './report-branch.component.html',
  styleUrls: ['./report-branch.component.css']
})
export class ReportBranchComponent implements OnInit {
X :any;
public supply :any;
req :any;
reservation:any;
dateStart :Date;
dateEnd:Date;
report_supply :any;
report_req:any;
report_use:any;
report_reservation :any;
dataSource
warning_supply:any;
warning_req : any;
warning_reservation :any;
warning_use :any;
use :any;
Branch :any;

  constructor( private ReportBranchService: ReportBranchService, private _http: Http,private route: ActivatedRoute,
    private router: Router
    // private _csvService: CsvService
  ) { 
    this.ReportBranchService = ReportBranchService;
    //this.persons = PERSONS;
  }
  //persons: Person[];
  exportToExcel(event) {
    //this.ReportService.exportAsExcelFile(PERSONS, 'persons');
  }
  ngOnInit() {  
    this.Branch = localStorage.getItem('currentUserStatus');
   
    if(this.Branch==1){
      this.router.navigate(['/' + 'login']);
    }
    console.log("storagebranch" + this.Branch);
    // let obj = {
    //   dateStart : dateStart,
    //   dateEnd: dateEnd
    // }
    // this.ReportService.report_supply(obj).subscribe(data => {
    //   this.supply = data;
    //   console.log(data)
    //   this.dataSource = new MatTableDataSource(this.supply);
    // },
    //   error => console.log(error));
  }
  report(){
    let obj = {
      dateStart :this.dateStart,
      dateEnd:this.dateEnd,
      bid  : this.Branch
    }
    console.log( "dateStart :" + this.dateStart );
    console.log("dateEnd:" +this.dateEnd);
    console.log("branch:" +this.Branch);
    if(this.X == 1){
         
      this.ReportBranchService.report_supply(obj).subscribe(data => {
        this.supply = data;
        console.log(data)
        if(this.supply==0){
          this.warning_supply = 1;  
          console.log("supply = 0");
      }
      else{
        this.report_supply = 1
        this.report_req = 0;
        this.report_reservation = 0;
        this.report_use = 0;
        this.warning_supply = 0;
        this.warning_req  = 0;
        this. warning_reservation  = 0;
        this.warning_use  = 0;
        this.displayedColumns_supply = ['supplyDate', 'productName', 'supplyQuantity'];
        this.dataSource = new MatTableDataSource(this.supply);
      }
      },error => console.log(error));
      
        
       
    }
    if(this.X == 2){
         
      this.ReportBranchService.report_req(obj).subscribe(data => {
        this.req = data;
        console.log(data)
        if(this.req==0){
          this.warning_req = 1;  
      }else{
        this.report_req = 1;
        this.report_supply = 0;
        this.report_reservation = 0;
        this.report_supply = 0
        this.warning_supply = 0;
      this.warning_req  = 0;
      this. warning_reservation  = 0;
      this.warning_use  = 0;
        this.displayedColumns_req = ['reqDate',  'productName', 'reqQuantity'];
        this.dataSource = new MatTableDataSource(this.req);
      }
      },
        error => console.log(error));
      
        
    }
    if(this.X == 3){
         
      this.ReportBranchService.report_use(obj).subscribe(data => {
        this.use = data;
        console.log(data)
        if(this.use==0){
          this.warning_use = 1;  
      }else{
        this.report_use = 1;
        this.report_req = 0;
        this.report_supply = 0;
        this.report_reservation = 0;  
        this.warning_supply = 0;
      this.warning_req  = 0;
      this. warning_reservation  = 0;
      this.warning_use  = 0;
        this.displayedColumns_use = ['UseDate',  'Course_Name', 'Product_Name','UseQuantity'];
        this.dataSource = new MatTableDataSource(this.use);
      }
      },
        error => console.log(error));
       
        
    }
    if(this.X == 4){
     
      this.ReportBranchService.report_reservation(obj).subscribe(data => {
        this.reservation = data;
        console.log(data)
        if(this.reservation==0){ 
          this.warning_reservation = 1;  
      }
      else{
        this.report_reservation = 1;
        this.report_req = 0;
        this.report_supply = 0;
        this.report_use = 0 ;
        this.warning_supply = 0;
        this.warning_req  = 0;
        this. warning_reservation  = 0;
        this.warning_use  = 0;
        this.displayedColumns_reservation = ['reservationDate',  'courseName'];
        this.dataSource = new MatTableDataSource(this.reservation);
      }

      },
      
        error => console.log(error));
       
        
    }
  }
  reports = [
    {value: '1', viewValue: 'รายงานการสั่งจ่าย'},
    {value: '2', viewValue: 'รายงานคำขอเบิกสินค้า'},
    {value: '3', viewValue: 'รายงานการใช้สินค้า'},
    {value: '4', viewValue: 'ข้อมูลการจองคอร์ส'}
    
  ];
  displayedColumns_supply = ['supplyDate',  'productName', 'supplyQuantity'];
  displayedColumns_req = ['reqDate',  'productName', 'reqQuantity'];
  displayedColumns_reservation = ['reservationDate', 'courseName'];
  displayedColumns_use = ['UseDate',  'Course_Name', 'Product_Name','UseQuantity'];

  // @ViewChild(MatPaginator) paginator: MatPaginator;
  // @ViewChild(MatSort) sort: MatSort;

  // ngAfterViewInit() {
  //   this.dataSource.paginator = this.paginator;
  //   this.dataSource.sort = this.sort;
  // }

  applyFilter(filterValue: string) {
    filterValue = filterValue.trim(); // Remove whitespace
    filterValue = filterValue.toLowerCase(); // Datasource defaults to lowercase matches
    this.dataSource.filter = filterValue;
  }
  sendDownloadRequest(url) {
    let headers = new Headers({
        'Content-Type': 'text/csv'
    });
    return this._http.get(url, { headers: headers })
        .toPromise()
        .then(res => {
            if(res && res["_body"]){
                this.downloadFile(res["_body"]);
            }
        })
        .catch(this.handleError);
}

handleError(error){
    console.log("error--  "+error);
}

downloadFile(data){
    let blob = new Blob(['\ufeff' + data], { type: 'text/csv;charset=utf-8;' });
    let dwldLink = document.createElement("a");
    let url = URL.createObjectURL(blob);
    let isSafariBrowser = navigator.userAgent.indexOf('Safari') != -1 && navigator.userAgent.indexOf('Chrome') == -1;
    if (isSafariBrowser) {  //if Safari open in new window to save file with random filename.
    dwldLink.setAttribute("target", "_blank");
}
    dwldLink.setAttribute("href", url);
    dwldLink.setAttribute("download", "Enterprise.csv");
    dwldLink.style.visibility = "hidden";
    document.body.appendChild(dwldLink);
    dwldLink.click();
    document.body.removeChild(dwldLink);
}

  exportPDF(){
    
      console.log("PDF");
  }
 
exportExcel() {
  if(this.X == 1){
    let obj = {
      dateStart :this.dateStart,
      dateEnd:this.dateEnd,
      bid  : this.Branch
      // dateStart: '2018-01-01',
      // dateEnd: '2018-04-14' 
        }
        this.ReportBranchService.report_supply(obj).subscribe(data => {
        this.supply = data;
        const Json2csvParser = require('json2csv').Parser;
        const fields = ['SupplyDate', 'Product_Name','SupplyQuantity'];
        const json2csvParser = new Json2csvParser({ fields } );
        console.log()
        const csv = json2csvParser.parse(this.supply);
        console.log(csv);
        var blob = new Blob([new Uint8Array([0xEF, 0xBB, 0xBF]),csv], { type: 'application/vnd.ms-excel' });
        var url= window.URL.createObjectURL(blob);
        var link=document.createElement('a');
        link.href=window.URL.createObjectURL(blob);
        link.download="Report";
        link.click();
        console.log(data)
      });
  }
  if(this.X == 2){
    let obj = {
      dateStart :this.dateStart,
      dateEnd:this.dateEnd,
      bid  : this.Branch
      // dateStart: '2018-01-01',
      // dateEnd: '2018-04-14' 
        }
        this.ReportBranchService.report_req(obj).subscribe(data => {
        this.req = data;
        const Json2csvParser = require('json2csv').Parser; 
        const fields = ['ReqDate',  'Product_Name', 'ReqQuantity'];
        const json2csvParser = new Json2csvParser({ fields } );
        const csv = json2csvParser.parse(this.req);
        console.log(csv);
        var blob = new Blob([new Uint8Array([0xEF, 0xBB, 0xBF]),csv], { type: 'application/vnd.ms-excel' });
        var url= window.URL.createObjectURL(blob);
        var link=document.createElement('a');
        link.href=window.URL.createObjectURL(blob);
        link.download="Report";
        link.click();
        console.log(data)
      });
  }
  if(this.X == 3){
    let obj = {
      dateStart :this.dateStart,
      dateEnd:this.dateEnd,
      bid  : this.Branch
      // dateStart: '2018-01-01',
      // dateEnd: '2018-04-14' 
        }
        this.ReportBranchService.report_use(obj).subscribe(data => {
        this.use = data;
        const Json2csvParser = require('json2csv').Parser;
        const fields = ['UseDate', 'Course_Name', 'Product_Name','UseQuantity',];
        const json2csvParser = new Json2csvParser({ fields } );
        const csv = json2csvParser.parse(this.use);
        console.log(csv);
        var blob = new Blob([new Uint8Array([0xEF, 0xBB, 0xBF]),csv], { type: 'application/vnd.ms-excel' });
        var url= window.URL.createObjectURL(blob);
        var link=document.createElement('a');
        link.href=window.URL.createObjectURL(blob);
        link.download="Report";
        link.click();
        console.log(data)
      });
  }
  if(this.X == 4){
    let obj = {
      dateStart :this.dateStart,
      dateEnd:this.dateEnd,
      bid  : this.Branch
      // dateStart: '2018-01-01',
      // dateEnd: '2018-04-14' 
        }
        this.ReportBranchService.report_reservation(obj).subscribe(data => {
        this.reservation = data;
        const Json2csvParser = require('json2csv').Parser; 
        const fields = ['Reservation','Course_Date',  'Course_Name'];
        const json2csvParser = new Json2csvParser({ fields } );
        const csv = json2csvParser.parse(this.reservation);
        console.log(csv);
        var blob = new Blob([new Uint8Array([0xEF, 0xBB, 0xBF]),csv], { type: 'application/vnd.ms-excel' });
        var url= window.URL.createObjectURL(blob);
        var link=document.createElement('a');
        link.href=window.URL.createObjectURL(blob);
        link.download="Report";
        link.click();
        console.log(data)
      });
  }

}



convert(){
  let obj = {
    dateStart :this.dateStart,
    dateEnd:this.dateEnd
  }
  console.log("dateStart"+this.dateStart);
  console.log("dateEnd"+this.dateEnd);
    this.ReportBranchService.report_supply(obj).subscribe(data => {
      this.supply = data;
      console.log("in convert"+this.supply)

    },error => console.log(error));
   
  var item = {
//date: this.supply.supplyDate,

  "Name" : "กัลยา",
  "Age" : "ใจลูน",
  "Gender" : "หญิง"
  
  };
  var doc = new jsPDF();
  var col = ["วันที่สั่งจ่าย", "สาขา" ];
  var rows = [];

  for(var key in item){
      var temp = [key, item[key]];
      rows.push(temp);
  }

  // var jsPDF = require('jspdf');
  // require('jspdf-autotable');

  doc.autoTable(col, rows);
 
   //doc.setFontType("charset=UTF-8"); 
  doc.save('Test.pdf');
}


}



