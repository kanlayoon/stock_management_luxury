import { Injectable } from '@angular/core';
import { Product } from '../product/product.model';
import { ApiService } from '../services/api.service';
import { ProxyConfigService } from '../services/proxy.config.service';
import { Headers, Http, RequestOptions, Response } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/toPromise';
import { ApiUrl } from '../services/apiUrl.service';


@Injectable()
export class SupplyService {
  private actionUrl: string;
  constructor(private _http: Http, private apiUrl: ApiUrl) {
    this.actionUrl = apiUrl.ApiServer;
  }

  public getAll = (Branch : any): Observable<any[]> =>  {
    return this._http.get(this.actionUrl + "/BranchProduct/id2/"+Branch)
    .map( (response: Response) => <any>response.json() )
    .do( x => console.log(x));
  }
  
  public getProduct = (Branch : any): Observable<any[]> =>  {
    return this._http.get(this.actionUrl + "/ProductAddAmount/"+Branch)
    .map( (response: Response) => <any>response.json() )
    .do( x => console.log(x));
  }

  public getBranch = (): Observable<any[]> =>  {
    return this._http.get(this.actionUrl + "/Branch")
    .map( (response: Response) => <any>response.json() )
    .do( x => console.log(x));
  }

  public supplyReq = (obj:any): Observable<any[]> =>  {
    let headers = new Headers({'Content-Type': 'application/json'});
    let options = new RequestOptions({ headers: headers });
    return this._http.put(this.actionUrl + "/supply/supply1" , obj,options)
    .map( (response: Response) => <any>response.json() )
    .do( x => console.log(x));
  }
 
  
  public supply = ( obj:any): Observable<any> => {
    let headers = new Headers({'Content-Type': 'application/json'});
    let options = new RequestOptions({ headers: headers });
    return this._http.put(this.actionUrl + "/supply" , obj, options )
    .map( (response: Response) => <any>response.json() )
    .do( x => console.log(x));   
  }

  
  public checkProduct = (obj:any): Observable<any> => {
    return this._http.post(this.actionUrl + "/check/product" ,obj )
    .map( (response: Response) => <any>response.json() )
    .do( x => console.log(x));   
  }

  public supplyInsert = ( obj:any): Observable<any> => {
    let headers = new Headers({'Content-Type': 'application/json'});
    let options = new RequestOptions({ headers: headers });
    return this._http.put(this.actionUrl + "/supply/insert" , obj, options )
    .map( (response: Response) => <any>response.json() )
    .do( x => console.log(x));   
  }
  public supplyUpdate = ( obj:any): Observable<any> => {
    let headers = new Headers({'Content-Type': 'application/json'});
    let options = new RequestOptions({ headers: headers });
    return this._http.put(this.actionUrl + "/supply/update" , obj, options )
    .map( (response: Response) => <any>response.json() )
    .do( x => console.log(x));   
  }
  public supplyDel = (): Observable<any> => {
    let headers = new Headers({'Content-Type': 'application/json'});
    let options = new RequestOptions({ headers: headers });
    return this._http.put(this.actionUrl + "/supply/del", options )
    .map( (response: Response) => <any>response.json() )
    .do( x => console.log(x));   
  }
  public getProduct_checkEXP = ( obj:any): Observable<any> => {
    let headers = new Headers({'Content-Type': 'application/json'});
    let options = new RequestOptions({ headers: headers });
    return this._http.put(this.actionUrl + "/get/product_exp" , obj, options )
    .map( (response: Response) => <any>response.json() )
    .do( x => console.log(x));   
  }
  



}
