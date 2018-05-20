import { Component, OnInit, ViewChild } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { MatFormFieldModule, MatError, MatFormField, MatPlaceholder, MatFormFieldControl } from '@angular/material/form-field';
import { MatPaginator, MatSort, MatTableDataSource } from '@angular/material';
import { ReservationService } from '../reservation/reservation.service';
import { Http, Headers, RequestOptions, Response } from '@angular/http';
import { Observable, Subject } from 'rxjs/Rx';
import { DataSource } from '@angular/cdk/collections';
import { Router, ActivatedRoute } from '@angular/router';
import { reservation } from './reservation.model';
export class State {
  constructor(public name: string, public population: string, public flag: string) { }
}

@Component({
  selector: 'app-reservation',
  templateUrl: './reservation.component.html',
  styleUrls: ['./reservation.component.css']
})
export class ReservationComponent implements OnInit {
  dataSource1: MatTableDataSource<any>;
  reservation: any[];
  bid: any;
  result: any;
  Product_Code: any;
  noProduct: any;
  totalAmount_temp: any;
  AmountOfkey: any;
  i_tood_i_sus = [];
date :Date;
Branch : any;
  constructor(private route: ActivatedRoute,
    private router: Router,
    private ReservationService: ReservationService, private _http: Http) {

  }
  ngOnInit() {
    
    this.Branch = localStorage.getItem('currentUserStatus');
   
    if(this.Branch==1){
      this.router.navigate(['/' + 'login']);
    }
    let obj = {
      bid : this.Branch,
      Date: this.date = new Date(),
      
    }
    console.log("date" + this.date);
    this.ReservationService.get_reservation(obj).subscribe(data => {
      this.reservation = data;
      console.log(data);
      this.dataSource1 = new MatTableDataSource(this.reservation);
    },
      error => console.log(error));
  }
  applyFilter(filterValue: string) {
    filterValue = filterValue.trim(); // Remove whitespace
    filterValue = filterValue.toLowerCase(); // Datasource defaults to lowercase matches
    this.dataSource1.filter = filterValue;
  }

  checkProductReservation() {
    this.bid = 3;
    let obj = {
      bid: 3
    }
    this.ReservationService.check(obj).subscribe(data => {
      this.result = data;
     
      console.log("result" + this.result.numberOfkey);
      this.i_tood_i_sus.push(data.Product_Code);
      this.i_tood_i_sus.push(data.AmountOfkey);
      this.i_tood_i_sus.push(data.noProduct);
      console.log("Itood: " + this.i_tood_i_sus);
      
      let i = 0;
      if (this.result.Product_Code[0] == 0) {
        document.getElementById("openModalButton3").click();
        console.log("product code =0 ");
      }
      else {
        for (i = 0; i < this.result.numberOfkey; i++) {
          this.Product_Code = this.result.Product_Code[i];
          this.noProduct = this.result.noProduct[i];
          this.totalAmount_temp = this.result.totalAmount_temp[i];
          this.AmountOfkey = this.result.AmountOfkey[i];
          if (this.result.Product_Code[i] != 0 && this.result.noProduct != 0) {

            document.getElementById("openModalButton1").click();
          }
          if (this.result.Product_Code[i] != 0 && this.result.noProduct == 0) {

            document.getElementById("openModalButton2").click();
          }

        }
      }

    },
      error => console.log(error));
    console.log("checkProductReservation");


  }
  displayedColumns = ['courseName', 'date'];
  // dataSource: MatTableDataSource<UserData>;
 // dataSource = new ProductDataSource(this.ReservationService);
}
// export class ProductDataSource extends DataSource<any> {
//   constructor(private ReservationService: ReservationService) {
//     super();
//   }
//   connect(): Observable<reservation[]> {
//     return this.ReservationService.get_reservation(obj);
//   }
//   disconnect() { }
// }







