public class generateJSON { 
 
public generateJSON(Opportunity op)
        {
            opportunityObject=op;
            JSONGenerator generator  = JSON.createGenerator(true);
            generator.writeStartObject();

            // Write data to the JSON string.
            generator.writeStringField('opportunityId', op.Id);
            generator.writeStringField('opportunityName', op.Name);
            generator.writeStringField('accountName', op.account.Name);
            generator.writeDateField('closeDate', op.closeDate);
            generator.writeNumberField('amount', op.amount);
            
            generator.writeEndObject();            
            // Get the JSON string.
            jsonOp= generator.getAsString();
            
            
        }
}
