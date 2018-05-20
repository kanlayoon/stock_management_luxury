import { Injectable } from '@angular/core';

import { ApiService } from '../services/api.service';
import { ProxyConfigService } from '../services/proxy.config.service';
import { Headers, Http, RequestOptions, Response } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/toPromise';
import { ApiUrl } from '../services/apiUrl.service';


@Injectable()
export class ReservationService {
  private actionUrl: string;
  constructor(private _http: Http, private apiUrl: ApiUrl) {
    this.actionUrl = apiUrl.ApiServer;
  }

  // public get_reservation = (): Observable<any[]> =>  {
  //   return this._http.get(this.actionUrl + "/reservation/3")
  //   .map( (response: Response) => <any>response.json() )
  //   .do( x => console.log(x));
  // }
  public get_reservation = ( obj:any): Observable<any> => {
    let headers = new Headers({'Content-Type': 'application/json'});
    let options = new RequestOptions({ headers: headers });
    return this._http.post(this.actionUrl + "/reservation" , obj, options )
    .map( (response: Response) => <any>response.json() )
    .do( x => console.log(x));   
  }



  public check = ( obj:any): Observable<any> => {
    let headers = new Headers({'Content-Type': 'application/json'});
    let options = new RequestOptions({ headers: headers });
    return this._http.put(this.actionUrl + "/check/productReservation" , obj, options )
    .map( (response: Response) => <any>response.json() )
    .do( x => console.log(x));   
  }

}
