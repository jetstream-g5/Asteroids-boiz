package wiskunde 
{
        /**
         * ...
         * @author
         */
        public class VectorOperations 
        {
                public static function addVectors(a:Vector2D, b:Vector2D):Vector2D
                {
                        var result:Vector2D = new Vector2D(a.dx + b.dx, a.dy + b.dy);
                        return result
                }
                public static function substractVectors(a:Vector2D, b:Vector2D):Vector2D
                {
                        var result:Vector2D = new Vector2D(a.dx - b.dx, a.dy - b.dy);
                        return result
                }
                
                public static function scalairMultiplication(num:Number, v:Vector2D):Vector2D
                {
                        var result:Vector2D = new Vector2D(v.dx * num, v.dy * num);
                        return result;
                }
                
                public static function dotproduct(a:Vector2D, b:Vector2D):Number {
                        var result:Number = a.dx * b.dx + a.dy * b.dy;
                        return result;
                }
                
        }

}
