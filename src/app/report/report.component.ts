import { Component, OnInit } from '@angular/core';
import { ViewChild} from '@angular/core';
import {MatPaginator, MatSort, MatTableDataSource} from '@angular/material';
import { ReportService } from './report.service';
import { DataSource } from '@angular/cdk/collections';
//import { CsvService } from "angular2-json2csv";
import * as json2csv from 'json2csv';
declare var require: any
declare let jsPDF;
import { Router, ActivatedRoute } from '@angular/router';
import { PERSONS, Person } from './model';
import { Observable } from 'rxjs';
import 'rxjs/add/operator/toPromise';
import { Http, Headers, RequestOptions, Response } from '@angular/http';
import pdfMake from "pdfmake/build/pdfmake";
import pdfFonts from "pdfmake/build/vfs_fonts";
pdfMake.vfs = pdfFonts.pdfMake.vfs;
import * as html2canvas from 'html2canvas';

@Component({
  selector: 'app-report',
  templateUrl: './report.component.html',
  styleUrls: ['./report.component.css']
})
export class ReportComponent implements OnInit {
X :any;

public supply :any =[];
req :any = [];
reservation:any = [];
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
use :any = [];
Branch : any;
reservationStat : any = [];
report_reservationStat : any;
warning_reservationStat :any;
  constructor( private ReportService: ReportService, private _http: Http,private route: ActivatedRoute,
    private router: Router
    // private _csvService: CsvService
  ) { 
    this.ReportService = ReportService;
    this.persons = PERSONS;
  }
  persons: Person[];
  exportToExcel(event) {
    this.ReportService.exportAsExcelFile(PERSONS, 'persons');
  }
  ngOnInit() {
    this.Branch = localStorage.getItem('currentUserStatus')
    if(this.Branch!=1){
      this.router.navigate(['/' + 'login']);
    }
    
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
      // this.report_supply = 0;
      // this.report_reservationStat =0;
      // this.warning_reservationStat = 0 ;
      // this.report_req = 0;
      // this.report_reservation = 0;
      // this.report_use = 0;
      // this.warning_supply = 0;  
      // this.warning_req  = 0;
      // this. warning_reservation  = 0;
      // this.warning_use  = 0;
    let obj = {
      dateStart :this.dateStart,
      dateEnd:this.dateEnd
    }
   
    console.log( "dateStart :" + this.dateStart );
    console.log("dateEnd:" +this.dateEnd);

    if(this.X == 1){
         console.log("report1");
      this.ReportService.report_supply(obj).subscribe(data => {
        this.supply = data;
        console.log(data)
        if(this.supply.length != 0){
          this.report_supply = 1
          this.report_reservationStat =0;
          this.warning_reservationStat = 0 ;
          this.report_req = 0;
          this.report_reservation = 0;
          this.report_use = 0;
          this.warning_supply = 0;
          this.warning_req  = 0;
          this. warning_reservation  = 0;
          this.warning_use  = 0;
          this.displayedColumns_supply = ['supplyDate', 'branchName', 'productName', 'supplyQuantity'];
          this.dataSource = new MatTableDataSource(this.supply);
        }
        else if(this.supply.length == 0){
          this.warning_supply = 1;  
          this.report_req = 0;
          this.report_use = 0;
          this.report_reservation = 0; 
          this.report_reservationStat =0;
          console.log("supply = 0");
      }

      },error => console.log(error));
     
   
        
       
    }
    else if(this.X == 2){
         
      this.ReportService.report_req(obj).subscribe(data => {
        this.req = data;
        console.log(data)
        if(this.req== 0){
          this.warning_req = 1; 
          this.report_use = 0;
          this.report_supply = 0;
          this.report_reservation = 0; 
          this.report_reservationStat =0; 
      }else{
        this.report_req = 1;
        this.report_supply = 0;
        this.report_reservation = 0;
        this.warning_supply = 0;
      this.warning_req  = 0;
      this. warning_reservation  = 0;
      this.warning_use  = 0;
      this.report_reservationStat =0;
      this.warning_reservationStat = 0 ;
        this.displayedColumns_req = ['reqDate', 'branchName', 'productName', 'reqQuantity'];
        this.dataSource = new MatTableDataSource(this.req);
      }
       
      },
        error => console.log(error));
       
        
    }
    else if(this.X == 3){
         
      this.ReportService.report_use(obj).subscribe(data => {
        this.use = data;
        console.log(data)
        if(this.use==0){
          this.warning_use = 1;  
          this.report_req = 0;
          this.report_supply = 0;
          this.report_reservation = 0; 
          this.report_reservationStat =0;
      }else{
        this.report_use = 1;
        this.report_req = 0;
        this.report_supply = 0;
        this.report_reservation = 0;  
        this.warning_supply = 0;
      this.warning_req  = 0;
      this. warning_reservation  = 0;
      this.warning_use  = 0;
      this.report_reservationStat =0;
      this.warning_reservationStat = 0 ;
        this.displayedColumns_use = ['UseDate', 'Branch_Name', 'Course_Name', 'Product_Name','UseQuantity'];
        this.dataSource = new MatTableDataSource(this.use);
      }
      },
        error => console.log(error));
       
        
    }
    else if(this.X == 4){
     
      this.ReportService.report_reservation(obj).subscribe(data => {
        this.reservation = data;
        console.log(data)
        if(this.reservation==0){
          this.warning_reservation = 1;  
          this.report_req = 0;
          this.report_supply = 0;
          this.report_use = 0; 
          this.report_reservationStat =0;
      }
      else{
         this.report_reservation = 1;
        this.report_req = 0;
        this.report_supply = 0;
        this.report_use = 0;
        this.warning_supply = 0;
        this.warning_req  = 0;
        this. warning_reservation  = 0;
        this.warning_use  = 0;
        this.report_reservationStat =0;
      this.warning_reservationStat = 0 ;
        this.displayedColumns_reservation = ['reservationDate', 'branchName', 'courseName'];
        this.dataSource = new MatTableDataSource(this.reservation);
      }
      },
        error => console.log(error));
       
       
    }
    else if(this.X == 5){
         
      this.ReportService.report_reservation_stat(obj).subscribe(data => {
        this.reservationStat = data;
        console.log(data) 
        if(this.report_reservationStat==0){
          this.warning_reservationStat = 1;  
          this.report_req = 0;
          this.report_supply = 0;
          this.report_reservation = 0; 
          this.report_use =0;
          //console.log("supply = 0");
      }
      else{
        this.report_reservationStat = 1;
        this.report_supply = 0 ;
        this.report_req = 0;
        this.warning_reservationStat = 0;
        this.report_reservation = 0;
        this.report_use = 0;
        this.warning_supply = 0;
        this.warning_req  = 0;
        this. warning_reservation  = 0;
        this.warning_use  = 0;
        this.displayedColumns_reservationStat = ['Course_name', 'number'];
        this.dataSource = new MatTableDataSource(this.reservationStat);
      }
        
      },error => console.log(error));
     
       
    }
  }
  reports = [
    {value: '1', viewValue: 'รายงานการสั่งจ่าย'},
    {value: '2', viewValue: 'รายงานคำขอเบิกสินค้า'},
    {value: '3', viewValue: 'รายงานการใช้สินค้า'},
    {value: '4', viewValue: 'ข้อมูลการจองคอร์ส'},
    {value: '5', viewValue: 'ข้อมูลสถิติการจอง'}
    
  ];
  displayedColumns_supply = ['supplyDate', 'branchName', 'productName', 'supplyQuantity'];
  displayedColumns_req = ['reqDate', 'branchName', 'productName', 'reqQuantity'];
  displayedColumns_reservation = ['reservationDate', 'branchName', 'courseName'];
  displayedColumns_use = ['UseDate', 'Branch_Name', 'Course_Name', 'Product_Name','UseQuantity',];
  displayedColumns_reservationStat = ['Course_name', 'number'];

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


  exportPDF(){
    
      console.log("PDF");
  }
 
exportExcel() {
  if(this.X == 1){
    console.log("dateeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeSup"+ this.dateStart + this.dateEnd)
    let obj = {
      dateStart :this.dateStart,
      dateEnd:this.dateEnd
      // dateStart: '2018-01-01',
      // dateEnd: '2018-04-14' 
        }
        
        this.ReportService.report_supply(obj).subscribe(data => {
        this.supply = data;
        const Json2csvParser = require('json2csv').Parser;
        const fields = ['SupplyDate', 'Branch_Name', 'Product_Name','SupplyQuantity'];
        const json2csvParser = new Json2csvParser({ fields } );
        const csv = json2csvParser.parse(this.supply);
        console.log(csv);
        var blob = new Blob([new Uint8Array([0xEF, 0xBB, 0xBF]),csv], { type: 'application/vnd.ms-excel' });
        var url= window.URL.createObjectURL(blob);
        var link=document.createElement('a');
        link.href=window.URL.createObjectURL(blob);
        link.download="Report supply";
        link.click();
        console.log(data)
      });
  }
  if(this.X == 2){
    let obj = {
      dateStart :this.dateStart,
      dateEnd:this.dateEnd
      // dateStart: '2018-01-01',
      // dateEnd: '2018-04-14' 
        }
        this.ReportService.report_req(obj).subscribe(data => {
        this.req = data;
        const Json2csvParser = require('json2csv').Parser; 
        const fields = ['ReqDate', 'Branch_Name', 'Product_Name', 'ReqQuantity'];
        const json2csvParser = new Json2csvParser({ fields } );
        const csv = json2csvParser.parse(this.req);
        console.log(csv);
        var blob = new Blob([new Uint8Array([0xEF, 0xBB, 0xBF]),csv], { type: 'application/vnd.ms-excel' });
        var url= window.URL.createObjectURL(blob);
        var link=document.createElement('a');
        link.href=window.URL.createObjectURL(blob);
        link.download="Report requisition";
        link.click();
        console.log(data)
      });
  }
  if(this.X == 3){
    let obj = {
      dateStart :this.dateStart,
      dateEnd:this.dateEnd
      // dateStart: '2018-01-01',
      // dateEnd: '2018-04-14' 
        }
        this.ReportService.report_use(obj).subscribe(data => {
        this.use = data;
        const Json2csvParser = require('json2csv').Parser;
        const fields = ['UseDate', 'Branch_Name', 'Course_Name', 'Product_Name','UseQuantity',];
        const json2csvParser = new Json2csvParser({ fields } );
        const csv = json2csvParser.parse(this.use);
        console.log(csv);
        var blob = new Blob([new Uint8Array([0xEF, 0xBB, 0xBF]),csv], { type: 'application/vnd.ms-excel' });
        var url= window.URL.createObjectURL(blob);
        var link=document.createElement('a');
        link.href=window.URL.createObjectURL(blob);
        link.download="Report product using";
        link.click();
        console.log(data)
      });
  }
  if(this.X == 4){
    let obj = {
      dateStart :this.dateStart,
      dateEnd:this.dateEnd
        }
        console.log("reservation");
        this.ReportService.report_reservation(obj).subscribe(data => {
        this.reservation = data;
        const Json2csvParser = require('json2csv').Parser; 
        const fields = ['ReservationCourse_Date' as 'วันที่จอง', 'Branch_Name' as 'สาขา', 'Course_Name' as 'คอร์ส'];
        const json2csvParser = new Json2csvParser({ fields } );
       
        //const head = json2csvParser2. 
        const csv = json2csvParser.parse(this.reservation);
        console.log(csv);
       // var blob = new Blob([fields1]);
        var blob = new Blob([new Uint8Array([0xEF, 0xBB, 0xBF]),csv], { type: 'application/vnd.ms-excel' });
        var url= window.URL.createObjectURL(blob);
        var link=document.createElement('a');
        link.href=window.URL.createObjectURL(blob);
        link.download="Report reservation";
        link.click();
        console.log(data)
      });
  }
  if(this.X == 5){
    let obj = {
      dateStart :this.dateStart,
      dateEnd:this.dateEnd
        }
        console.log("reservation");
        this.ReportService.report_reservation_stat(obj).subscribe(data => {
        this.reservation = data;
        const Json2csvParser = require('json2csv').Parser; 
        const fields = ['Course_Name' as 'วันที่จอง', 'numberOfCourse' as 'สาขา'];
        const json2csvParser = new Json2csvParser({ fields } );
       
        //const head = json2csvParser2. 
        const csv = json2csvParser.parse(this.reservation);
        console.log(csv);
       // var blob = new Blob([fields1]);
        var blob = new Blob([new Uint8Array([0xEF, 0xBB, 0xBF]),csv], { type: 'application/vnd.ms-excel' });
        var url= window.URL.createObjectURL(blob);
        var link=document.createElement('a');
        link.href=window.URL.createObjectURL(blob);
        link.download="Report reservation statistic";
        link.click();
        console.log(data)
      });
  }

}
 

pdftest(){ 
  let obj = {
  // dateStart :this.dateStart,
  // dateEnd:this.dateEnd
  dateStart: '2018-01-01',
  dateEnd: '2018-04-14' 
    }
    console.log("reservation");
    this.ReportService.report_reservation(obj).subscribe(data => {
    this.reservation = data;
    const doc = new jsPDF('p', 'pt');
    doc.text('kanlaya' ,10,10);
    var col = ['ReservationCourse_Date', 'Branch_Name', 'Course_Name'];
    var rows =  this.reservation;
    doc.autoTable(col,rows);
    doc.save('TestPdf.pdf');
    });
  
 
}
pdf(){
  let obj = {
    // dateStart :this.dateStart,
    // dateEnd:this.dateEnd
    dateStart: '2018-01-01',
    dateEnd: '2018-04-14' 
      }
      this.ReportService.report_reservation(obj).subscribe(data => {
      this.reservation = data;
      const Json2csvParser = require('json2csv').Parser; 
      const fields = ['ReservationCourse_Date', 'Branch_Name', 'Course_Name'];
      const json2csvParser = new Json2csvParser({ fields } );
      const pdf = json2csvParser.parse(this.reservation);
      console.log(pdf);
      var blob = new Blob([pdf], { type: 'application/pdf' });
      var url= window.URL.createObjectURL(blob);
      window.open(url);
      var link=document.createElement('a');
      link.href=window.URL.createObjectURL(blob);
      link.download="Report";
      link.click();
    
    });
}
test(){
  let obj = {
    // dateStart :this.dateStart,
    // dateEnd:this.dateEnd
    dateStart: '2018-01-01',
    dateEnd: '2018-04-14' 
      }
      this.ReportService.report_reservation(obj).subscribe(data => {
      this.reservation = data;
      const Json2csvParser = require('json2csv').Parser; 
      const fields = ['ReservationCourse_Date', 'Branch_Name', 'Course_Name'];
      const json2csvParser = new Json2csvParser({ fields } );
      const pdf = json2csvParser.parse(this.reservation);
      //console.log(json2csvParser);
      console.log(pdf);
      //var array = JSON.parse(pdf)
     // console.log(array);
      //var blob = new Blob([pdf], { type: 'application/pdf;base64' });
     // var url= window.URL.createObjectURL(blob);
      
      var doc = new jsPDF('p', 'pt');
          var col = ['ReservationCourse_Date', 'Branch_Name', 'Course_Name'];
          var rows = [pdf];
        
          for( const pdf in rows){
            
              var temp = [pdf, rows[pdf]];
              rows.push(temp);
          }
        
           //var jsPDF = require('jspdf');
           //require('jspdf-autotable');
        
          doc.autoTable(col, rows);
         
           //doc.setFontType("Uint8Array([0xEF, 0xBB, 0xBF])"); 
          doc.save('Test.pdf');


    },error => console.log(error));

}


//pdf
convert(){
  let obj = {
    dateStart: '2018-01-01',
      dateEnd: '2018-04-14' 
  }

    this.ReportService.report_req(obj).subscribe(data => {
      this.req = data;
      console.log("in convert"+this.req)
      var item = 
      {
        //date: this.supply.supplyDate,
        ReqDate: "2017-12-31T00:00:00", Branch_Name: "เซ็นทรัลซิตี้ บางนา", Product_Name: "เซรั่มผิวขาวววว", ReqQuantity: 250
        //  "Name" : "กัลยา",
        //   "Age" : "ใจลูน",
        //    "Gender" : "หญิง"
          
         };
        
         //doc.text(20, 20, 'รายงาน');
         var head = ['report']  
          var doc = new jsPDF('p', 'pt');
          var col = ['ReqDate', 'Branch_Name', 'Product_Name', 'ReqQuantity'];
          let rows= this.req;
        

          
           for(var key in item){
            
               var temp = [key, item[key]];
               rows.push(temp);
           }
        
           //var jsPDF = require('jspdf');
           //require('jspdf-autotable');
        
          doc.autoTable(head , col, rows);
         
           //doc.setFontType("Uint8Array([0xEF, 0xBB, 0xBF])"); 
          doc.save('Test.pdf');


    },error => console.log(error));
   
 
}


  printPDF(){

//ต้องระบุตามชื่อของ ไฟล์ font
pdfMake.fonts = {
  fonts: {
    normal: 'THSarabun.ttf',
    bold: 'THSarabun-Bold.ttf',
    italics: 'THSarabun-Italic.ttf',
    bolditalics: 'THSarabun-BoldItalic.ttf'
  },
  Roboto: {
    normal: 'Roboto-Regular.ttf',
    bold: 'Roboto-Medium.ttf',
    italics: 'Roboto-Italic.ttf',
    bolditalics: 'Roboto-MediumItalic.ttf'
  }
}
    var docDefinition = {
      content: [
        { text: 'สวัสดีประเทศไทย reat pdf demo ', fontSize: 15 },
      ],
      defaultStyle:{
        font : 'THSarabun'
      }
    };
    pdfMake.createPdf(docDefinition).open()
  
  }

   testconvas(){
     
    var options = {
      format: 'JPEG',
//                    pagesplit: true,
      "background": '#000',
  };
    let res = "รายงานการจอวคอร์ส"
//html2canvas(document.getElementById('results')).then(function(canvas)
html2canvas(document.getElementById("report")).then(function(canvas) {
  document.body.appendChild(canvas)
    // var doc = canvas.toDataURL("image/png");
    var doc = new jsPDF('p','pt','a4');
   // doc.addImage(img,'JPEG',10,30);
   doc.addHTML(canvas , 30, 35, options,function(){  
     //doc.text(res)
      doc.save('report.pdf');
   });


    });
    
   }

}
