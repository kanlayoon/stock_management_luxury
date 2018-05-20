import { Injectable } from '@angular/core';

import { ApiService } from '../services/api.service';
import { ProxyConfigService } from '../services/proxy.config.service';
import { Headers, Http, RequestOptions, Response } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/toPromise';
import { ApiUrl } from '../services/apiUrl.service';


@Injectable()
export class UsingProductBService {
  private actionUrl: string;
  constructor(private _http: Http, private apiUrl: ApiUrl) {
    this.actionUrl = apiUrl.ApiServer;
  }

  public get_course = (): Observable<any[]> =>  {
    return this._http.get(this.actionUrl + "/Allcourses")
    .map( (response: Response) => <any>response.json() )
    .do( x => console.log(x));
  }
  public getAll = (Branch:any): Observable<any[]> =>  {
    return this._http.get(this.actionUrl + "/BranchProduct/id2/"+Branch)
    .map( (response: Response) => <any>response.json() )
    .do( x => console.log(x));
  }
  public useProduct = (obj:any): Observable<any[]> =>  {
    let headers = new Headers({'Content-Type': 'application/json'});
    let options = new RequestOptions({ headers: headers });
    return this._http.put(this.actionUrl + "/useProduct/insert" ,obj, options)
    .map( (response: Response) => <any>response.json() )
    .do( x => console.log(x));
  }
  public getCourseProduct = (id_c:any): Observable<any[]> =>  {
    return this._http.get(this.actionUrl + "/CourseProduct/" + id_c)
    .map( (response: Response) => <any>response.json() )
    .do( x => console.log(x));
  }
  public getKey = (): Observable<any[]> =>  {
    return this._http.get(this.actionUrl + "/getKey") 
    .map( (response: Response) => <any>response.json() )
    .do( x => console.log(x));
  }
  public useProduct_update = (obj:any): Observable<any[]> =>  {
    let headers = new Headers({'Content-Type': 'application/json'});
    let options = new RequestOptions({ headers: headers });
    return this._http.put(this.actionUrl + "/useProduct/update" ,obj, options)
    .map( (response: Response) => <any>response.json() )
    .do( x => console.log(x));
  }
  public useProduct_del = (obj:any): Observable<any[]> =>  {
    let headers = new Headers({'Content-Type': 'application/json'});
    let options = new RequestOptions({ headers: headers });
    return this._http.put(this.actionUrl + "/useProduct/del" ,obj, options)
    .map( (response: Response) => <any>response.json() )
    .do( x => console.log(x));
  }
}

