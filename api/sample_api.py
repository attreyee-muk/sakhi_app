from flask import Flask,request
import joblib

app=Flask(__name__)
@app.route('/',methods=["GET"])
def hello():
    return "Hello world"

@app.route('/api',methods=['GET'])
def toUpperCase():
    d={}
    fname=request.args.get("fname")
    print(type(fname))
    confname=str.upper(fname)
    d['name']=confname
    print(confname)
    return(d)
@app.route('/add',methods=['POST','GET'])
def adding():
    data=request.json
    print(data)
    sum=int(data["key1"])+int(data["key2"])
    print(sum)
    data["result"]=sum
    return data 
@app.route('/predict',methods=["POST","GET"])
def predicting_model():
    data=request.json
    print(data)
    pred1={}
    keys=[]
    values=[]
    decision=""
    for i in data:
        keys.append(i)
        values.append(float(data[i]))
    print("The length of the list is ",len(keys))
    print("The values are ",values)
    clf=joblib.load('PCOD-predictions_(1).joblib')
    # input_data=[[36,52,150,23.111111,15,80,20,10,4,2,4,0,0,1.99,2.8,1.51,
    #                       1.854306,40,38,0.95,6.65,11.74,27.7,0.25,125,0,0,0,0,0,0,0,
    #                       110,80,1,1,14,17,2.5]]
    input_data=[values]
    predictions=clf.predict(input_data)
    predictions=predictions.tolist()
    print("Hii hello",predictions)
    pred=predictions[0]
    if(pred==1):
        decision="Yes"
    else:
        decision="No"
    pred1["Prediction"]=pred
    pred1["decision"]=decision
    return pred1


#main
if __name__=="__main__":
    app.run(host='0.0.0.0', port=5000,debug=True)


